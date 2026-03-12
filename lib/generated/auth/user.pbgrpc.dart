// This is a generated file - do not edit.
//
// Generated from user.proto.

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

import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('auth.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AuthResponse> register($0.RegisterRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> login($0.LoginRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckUserResponse> checkUser($0.CheckUserRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$checkUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout($0.LogoutRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> getProfile($0.GetProfileRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

    // method descriptors

  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.AuthResponse>(
      '/auth.AuthService/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      $0.AuthResponse.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.AuthResponse>(
      '/auth.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $0.AuthResponse.fromBuffer);
  static final _$checkUser = $grpc.ClientMethod<$0.CheckUserRequest, $0.CheckUserResponse>(
      '/auth.AuthService/CheckUser',
      ($0.CheckUserRequest value) => value.writeToBuffer(),
      $0.CheckUserResponse.fromBuffer);
  static final _$logout = $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
      '/auth.AuthService/Logout',
      ($0.LogoutRequest value) => value.writeToBuffer(),
      $0.LogoutResponse.fromBuffer);
  static final _$getProfile = $grpc.ClientMethod<$0.GetProfileRequest, $0.User>(
      '/auth.AuthService/GetProfile',
      ($0.GetProfileRequest value) => value.writeToBuffer(),
      $0.User.fromBuffer);
}

@$pb.GrpcServiceName('auth.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.AuthResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.AuthResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckUserRequest, $0.CheckUserResponse>(
        'CheckUser',
        checkUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckUserRequest.fromBuffer(value),
        ($0.CheckUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LogoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProfileRequest, $0.User>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProfileRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> register_Pre($grpc.ServiceCall $call, $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.AuthResponse> register($grpc.ServiceCall call, $0.RegisterRequest request);

  $async.Future<$0.AuthResponse> login_Pre($grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.AuthResponse> login($grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$0.CheckUserResponse> checkUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CheckUserRequest> $request) async {
    return checkUser($call, await $request);
  }

  $async.Future<$0.CheckUserResponse> checkUser($grpc.ServiceCall call, $0.CheckUserRequest request);

  $async.Future<$0.LogoutResponse> logout_Pre($grpc.ServiceCall $call, $async.Future<$0.LogoutRequest> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$0.LogoutResponse> logout($grpc.ServiceCall call, $0.LogoutRequest request);

  $async.Future<$0.User> getProfile_Pre($grpc.ServiceCall $call, $async.Future<$0.GetProfileRequest> $request) async {
    return getProfile($call, await $request);
  }

  $async.Future<$0.User> getProfile($grpc.ServiceCall call, $0.GetProfileRequest request);

}
