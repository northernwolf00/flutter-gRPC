import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/auth/user.pbgrpc.dart';
import 'auth_interceptor.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _roleKey = 'user_role';
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  Future<void> saveAuthData({
    required String token,
    required String refreshToken,
    required String userId,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_roleKey, role);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  Future<User?> getProfile() async {
    final channel = ClientChannel(
      'pandadevteam.net',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    final client = AuthServiceClient(
      channel,
      interceptors: [AuthInterceptor()],
    );

    try {
      final response = await client.getProfile(GetProfileRequest());
      return response;
    } catch (e) {
      return null;
    } finally {
      await channel.shutdown();
    }
  }

  Future<void> logout() async {
    final refreshToken = await getRefreshToken();
    
    if (refreshToken != null && refreshToken.isNotEmpty) {
      final channel = ClientChannel(
        'pandadevteam.net',
        port: 50051,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );
      final client = AuthServiceClient(channel);
      
      try {
        await client.logout(LogoutRequest()..refreshToken = refreshToken);
      } catch (e) {
        debugPrint('Server-side logout failed: $e');
      } finally {
        await channel.shutdown();
      }
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_roleKey);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
