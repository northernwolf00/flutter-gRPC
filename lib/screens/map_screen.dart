import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:geolocator/geolocator.dart';
import '../generated/geo/geo.pbgrpc.dart';
import '../utils/logger.dart';
import 'package:iconly/iconly.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final Map<String, Location> _userLocations = {};

  // gRPC Client
  late GeoServiceClient _client;
  late ClientChannel _channel;

  // Stream controller for client-streaming to server
  StreamController<Location> _locationStreamController =
      StreamController<Location>();

  // Device location subscription
  StreamSubscription<Position>? _positionSubscription;

  final String _currentUserId = "1";

  // === UI Log state ===
  final List<LogEntry> _logs = [];
  String _streamStatus = "⏳ Connecting...";
  bool _showLogs = true;

  void _addLog(String message, {LogLevel level = LogLevel.info}) {
    final now = DateTime.now();
    final timeStr =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    setState(() {
      _logs.insert(0, LogEntry(time: timeStr, message: message, level: level));
      // Keep max 50 logs
      if (_logs.length > 50) _logs.removeLast();
    });
    debugPrint("[$timeStr] ${level.name.toUpperCase()} $message");
  }

  @override
  void initState() {
    super.initState();
    _initGrpc();
    _initLocation();
  }

  int _retryCount = 0;
  static const int _maxRetries = 5;

  void _initGrpc() {
    _addLog("Connecting to pandadevteam.net:50052...");
    _channel = ClientChannel(
      'pandadevteam.net',
      port: 50052,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = GeoServiceClient(_channel);
    _startUploadStream();
  }

  void _startUploadStream() {
    // Create a fresh stream controller if the old one is closed
    if (_locationStreamController.isClosed) {
      _locationStreamController = StreamController<Location>();
    }

    _client.uploadLocations(_locationStreamController.stream).then(
      (summary) {
        setState(() =>
            _streamStatus = "✅ Completed (received: ${summary.received})");
        _addLog(
            "Stream completed. Server received: ${summary.received} locations.");
        _retryCount = 0;
      },
    ).catchError((error) {
      setState(() => _streamStatus = "❌ Error");
      _addLog("STREAM ERROR: $error", level: LogLevel.error);
      _scheduleRetry();
    });
    setState(() => _streamStatus = "📡 Stream opened");
    _addLog("Upload stream started", level: LogLevel.success);
  }

  void _scheduleRetry() {
    if (_retryCount >= _maxRetries) {
      _addLog("Max retries reached ($_maxRetries). Tap reconnect to try again.",
          level: LogLevel.error);
      setState(() => _streamStatus = "🔴 Disconnected");
      return;
    }
    _retryCount++;
    final delay = Duration(seconds: 2 * _retryCount); // 2s, 4s, 6s, 8s, 10s
    _addLog(
        "Retrying in ${delay.inSeconds}s (attempt $_retryCount/$_maxRetries)...",
        level: LogLevel.info);
    setState(() => _streamStatus = "🔄 Reconnecting in ${delay.inSeconds}s...");
    Future.delayed(delay, () {
      if (mounted) {
        _addLog("Reconnecting...");
        _startUploadStream();
      }
    });
  }

  void _reconnect() {
    _retryCount = 0;
    _channel.shutdown().then((_) {
      if (mounted) {
        _initGrpc();
      }
    });
  }

  Future<void> _initLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _addLog('Location services are disabled!', level: LogLevel.error);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _addLog('Location permissions denied!', level: LogLevel.error);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _addLog('Location permissions permanently denied!',
          level: LogLevel.error);
      return;
    }

    _addLog('Location permission granted', level: LogLevel.success);

    // Get initial position
    final position = await Geolocator.getCurrentPosition();
    _addLog(
        'Initial position: ${position.latitude.toStringAsFixed(5)}, ${position.longitude.toStringAsFixed(5)}');
    _onLocationChanged(position);
    _mapController.move(LatLng(position.latitude, position.longitude), 15.0);

    // Listen to location changes
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      _onLocationChanged(position);
    });
    _addLog('Location stream started (distanceFilter: 5m)',
        level: LogLevel.success);
  }

  void _onLocationChanged(Position position) {
    final location = Location()
      ..userId = _currentUserId
      ..lat = position.latitude
      ..lng = position.longitude
      ..timestamp = $fixnum.Int64(DateTime.now().millisecondsSinceEpoch);

    _updateUserLocation(location);

    // Send to server via the open stream
    if (!_locationStreamController.isClosed) {
      _locationStreamController.add(location);
      _addLog(
          "→ Sent: Lat=${location.lat.toStringAsFixed(5)}, Lng=${location.lng.toStringAsFixed(5)}",
          level: LogLevel.sent);
    } else {
      _addLog("Stream closed! Cannot send location.", level: LogLevel.error);
    }
  }

  void _updateUserLocation(Location location) {
    setState(() {
      _userLocations[location.userId] = location;
    });
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _locationStreamController.close();
    _channel.shutdown();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(37.9601, 58.3263),
              initialZoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.flutter_grps',
              ),
              MarkerLayer(
                markers: _userLocations.values.map((loc) {
                  final isMe = loc.userId == _currentUserId;
                  return Marker(
                    point: LatLng(loc.lat, loc.lng),
                    width: 70,
                    height: 70,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                isMe ? const Color(0xFF4A00E0) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Text(
                            isMe ? "Me" : loc.userId,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  isMe ? Colors.white : const Color(0xFF333333),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              isMe ? IconlyLight.user : IconlyLight.profile,
                              color: isMe
                                  ? const Color(0xFF4A00E0)
                                  : const Color(0xFF8E2DE2),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // Modern Top Bar Overlay
          Positioned(
            top: 50, // SafeArea top roughly
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A00E0).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(IconlyLight.location,
                        color: Color(0xFF4A00E0)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Live Tracker',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(IconlyLight.swap, color: Color(0xFF666666)),
                    tooltip: 'Reconnect gRPC',
                    onPressed: _reconnect,
                  ),
                  IconButton(
                    icon: Icon(_showLogs ? IconlyLight.hide : IconlyLight.show,
                        color: const Color(0xFF666666)),
                    tooltip: _showLogs ? 'Hide logs' : 'Show logs',
                    onPressed: () => setState(() => _showLogs = !_showLogs),
                  ),
                ],
              ),
            ),
          ),

          // Log panel overlay
          if (_showLogs)
            Positioned(
              left: 16,
              right: 16,
              bottom: 100, // Leave room for floating action button
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2C)
                      .withValues(alpha: 0.95), // Dark modern theme
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    // Status bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2A2A3C), // Slightly lighter header
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: Row(
                        children: [
                          const Icon(IconlyLight.activity,
                              color: Colors.greenAccent, size: 18),
                          const SizedBox(width: 8),
                          const Text('System Logs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13)),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1E2C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _streamStatus,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          // Clear logs
                          GestureDetector(
                            onTap: () => setState(() => _logs.clear()),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(IconlyLight.delete,
                                  color: Colors.white38, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Log list
                    Expanded(
                      child: _logs.isEmpty
                          ? const Center(
                              child: Text('No logs yet...',
                                  style: TextStyle(color: Colors.white38)))
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              itemCount: _logs.length,
                              itemBuilder: (context, index) {
                                final log = _logs[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${log.time} ',
                                        style: const TextStyle(
                                            color: Colors.white38,
                                            fontSize: 11,
                                            fontFamily: 'monospace'),
                                      ),
                                      Text(
                                        log.level.icon,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          log.message,
                                          style: TextStyle(
                                              color: log.level.color,
                                              fontSize: 11,
                                              fontFamily: 'monospace'),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),

          // Floating Action Button
          Positioned(
            right: 20,
            bottom: 30,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF4A00E0),
              foregroundColor: Colors.white,
              elevation: 4,
              child: const Icon(IconlyLight.discovery),
              onPressed: () {
                if (_userLocations.containsKey(_currentUserId)) {
                  final loc = _userLocations[_currentUserId]!;
                  _mapController.move(LatLng(loc.lat, loc.lng), 15.0);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
