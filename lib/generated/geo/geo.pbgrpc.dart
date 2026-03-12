// This is a generated file - do not edit.
//
// Generated from geo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'geo.pb.dart' as $0;

export 'geo.pb.dart';

@$pb.GrpcServiceName('geo.GeoService')
class GeoServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  GeoServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.StreamLocationResponse> streamLocations($async.Stream<$0.LocationPoint> request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$streamLocations, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.GetLocationsResponse> getLocations($0.GetLocationsRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getLocations, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNearbyResponse> getNearby($0.GetNearbyRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getNearby, request, options: options);
  }

    // method descriptors

  static final _$streamLocations = $grpc.ClientMethod<$0.LocationPoint, $0.StreamLocationResponse>(
      '/geo.GeoService/StreamLocations',
      ($0.LocationPoint value) => value.writeToBuffer(),
      $0.StreamLocationResponse.fromBuffer);
  static final _$getLocations = $grpc.ClientMethod<$0.GetLocationsRequest, $0.GetLocationsResponse>(
      '/geo.GeoService/GetLocations',
      ($0.GetLocationsRequest value) => value.writeToBuffer(),
      $0.GetLocationsResponse.fromBuffer);
  static final _$getNearby = $grpc.ClientMethod<$0.GetNearbyRequest, $0.GetNearbyResponse>(
      '/geo.GeoService/GetNearby',
      ($0.GetNearbyRequest value) => value.writeToBuffer(),
      $0.GetNearbyResponse.fromBuffer);
}

@$pb.GrpcServiceName('geo.GeoService')
abstract class GeoServiceBase extends $grpc.Service {
  $core.String get $name => 'geo.GeoService';

  GeoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LocationPoint, $0.StreamLocationResponse>(
        'StreamLocations',
        streamLocations,
        true,
        false,
        ($core.List<$core.int> value) => $0.LocationPoint.fromBuffer(value),
        ($0.StreamLocationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLocationsRequest, $0.GetLocationsResponse>(
        'GetLocations',
        getLocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLocationsRequest.fromBuffer(value),
        ($0.GetLocationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNearbyRequest, $0.GetNearbyResponse>(
        'GetNearby',
        getNearby_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNearbyRequest.fromBuffer(value),
        ($0.GetNearbyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.StreamLocationResponse> streamLocations($grpc.ServiceCall call, $async.Stream<$0.LocationPoint> request);

  $async.Future<$0.GetLocationsResponse> getLocations_Pre($grpc.ServiceCall $call, $async.Future<$0.GetLocationsRequest> $request) async {
    return getLocations($call, await $request);
  }

  $async.Future<$0.GetLocationsResponse> getLocations($grpc.ServiceCall call, $0.GetLocationsRequest request);

  $async.Future<$0.GetNearbyResponse> getNearby_Pre($grpc.ServiceCall $call, $async.Future<$0.GetNearbyRequest> $request) async {
    return getNearby($call, await $request);
  }

  $async.Future<$0.GetNearbyResponse> getNearby($grpc.ServiceCall call, $0.GetNearbyRequest request);

}
