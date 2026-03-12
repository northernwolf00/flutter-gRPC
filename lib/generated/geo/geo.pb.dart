// This is a generated file - do not edit.
//
// Generated from geo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LocationPoint extends $pb.GeneratedMessage {
  factory LocationPoint({
    $core.double? lat,
    $core.double? lng,
    $core.double? accuracy,
    $core.double? speed,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lng != null) result.lng = lng;
    if (accuracy != null) result.accuracy = accuracy;
    if (speed != null) result.speed = speed;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  LocationPoint._();

  factory LocationPoint.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory LocationPoint.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocationPoint', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'accuracy', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.OD)
    ..aInt64(5, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationPoint clone() => LocationPoint()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationPoint copyWith(void Function(LocationPoint) updates) => super.copyWith((message) => updates(message as LocationPoint)) as LocationPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationPoint create() => LocationPoint._();
  @$core.override
  LocationPoint createEmptyInstance() => create();
  static $pb.PbList<LocationPoint> createRepeated() => $pb.PbList<LocationPoint>();
  @$core.pragma('dart2js:noInline')
  static LocationPoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationPoint>(create);
  static LocationPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lng => $_getN(1);
  @$pb.TagNumber(2)
  set lng($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLng() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get accuracy => $_getN(2);
  @$pb.TagNumber(3)
  set accuracy($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccuracy() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccuracy() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get speed => $_getN(3);
  @$pb.TagNumber(4)
  set speed($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSpeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpeed() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => $_clearField(5);
}

class StreamLocationResponse extends $pb.GeneratedMessage {
  factory StreamLocationResponse({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  StreamLocationResponse._();

  factory StreamLocationResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory StreamLocationResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamLocationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamLocationResponse clone() => StreamLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamLocationResponse copyWith(void Function(StreamLocationResponse) updates) => super.copyWith((message) => updates(message as StreamLocationResponse)) as StreamLocationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamLocationResponse create() => StreamLocationResponse._();
  @$core.override
  StreamLocationResponse createEmptyInstance() => create();
  static $pb.PbList<StreamLocationResponse> createRepeated() => $pb.PbList<StreamLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamLocationResponse>(create);
  static StreamLocationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

class GetLocationsRequest extends $pb.GeneratedMessage {
  factory GetLocationsRequest() => create();

  GetLocationsRequest._();

  factory GetLocationsRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetLocationsRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationsRequest clone() => GetLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationsRequest copyWith(void Function(GetLocationsRequest) updates) => super.copyWith((message) => updates(message as GetLocationsRequest)) as GetLocationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationsRequest create() => GetLocationsRequest._();
  @$core.override
  GetLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetLocationsRequest> createRepeated() => $pb.PbList<GetLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsRequest>(create);
  static GetLocationsRequest? _defaultInstance;
}

class Location extends $pb.GeneratedMessage {
  factory Location({
    $core.String? userId,
    $core.double? lat,
    $core.double? lng,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (lat != null) result.lat = lat;
    if (lng != null) result.lng = lng;
    return result;
  }

  Location._();

  factory Location.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Location.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Location', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  @$core.override
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lat => $_getN(1);
  @$pb.TagNumber(2)
  set lat($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLat() => $_has(1);
  @$pb.TagNumber(2)
  void clearLat() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get lng => $_getN(2);
  @$pb.TagNumber(3)
  set lng($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLng() => $_has(2);
  @$pb.TagNumber(3)
  void clearLng() => $_clearField(3);
}

class GetLocationsResponse extends $pb.GeneratedMessage {
  factory GetLocationsResponse({
    $core.Iterable<Location>? locations,
  }) {
    final result = create();
    if (locations != null) result.locations.addAll(locations);
    return result;
  }

  GetLocationsResponse._();

  factory GetLocationsResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetLocationsResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..pc<Location>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationsResponse clone() => GetLocationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLocationsResponse copyWith(void Function(GetLocationsResponse) updates) => super.copyWith((message) => updates(message as GetLocationsResponse)) as GetLocationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationsResponse create() => GetLocationsResponse._();
  @$core.override
  GetLocationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetLocationsResponse> createRepeated() => $pb.PbList<GetLocationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsResponse>(create);
  static GetLocationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Location> get locations => $_getList(0);
}

class GetNearbyRequest extends $pb.GeneratedMessage {
  factory GetNearbyRequest({
    $core.double? lat,
    $core.double? lng,
    $core.double? radiusKm,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lng != null) result.lng = lng;
    if (radiusKm != null) result.radiusKm = radiusKm;
    return result;
  }

  GetNearbyRequest._();

  factory GetNearbyRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetNearbyRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNearbyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lng', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'radiusKm', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyRequest clone() => GetNearbyRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyRequest copyWith(void Function(GetNearbyRequest) updates) => super.copyWith((message) => updates(message as GetNearbyRequest)) as GetNearbyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNearbyRequest create() => GetNearbyRequest._();
  @$core.override
  GetNearbyRequest createEmptyInstance() => create();
  static $pb.PbList<GetNearbyRequest> createRepeated() => $pb.PbList<GetNearbyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNearbyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNearbyRequest>(create);
  static GetNearbyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lng => $_getN(1);
  @$pb.TagNumber(2)
  set lng($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLng() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get radiusKm => $_getN(2);
  @$pb.TagNumber(3)
  set radiusKm($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRadiusKm() => $_has(2);
  @$pb.TagNumber(3)
  void clearRadiusKm() => $_clearField(3);
}

class GetNearbyResponse extends $pb.GeneratedMessage {
  factory GetNearbyResponse({
    $core.Iterable<Location>? locations,
  }) {
    final result = create();
    if (locations != null) result.locations.addAll(locations);
    return result;
  }

  GetNearbyResponse._();

  factory GetNearbyResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetNearbyResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNearbyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'geo'), createEmptyInstance: create)
    ..pc<Location>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyResponse clone() => GetNearbyResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNearbyResponse copyWith(void Function(GetNearbyResponse) updates) => super.copyWith((message) => updates(message as GetNearbyResponse)) as GetNearbyResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNearbyResponse create() => GetNearbyResponse._();
  @$core.override
  GetNearbyResponse createEmptyInstance() => create();
  static $pb.PbList<GetNearbyResponse> createRepeated() => $pb.PbList<GetNearbyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNearbyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNearbyResponse>(create);
  static GetNearbyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Location> get locations => $_getList(0);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
