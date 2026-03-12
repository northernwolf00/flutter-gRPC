// This is a generated file - do not edit.
//
// Generated from user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'gender', '3': 5, '4': 1, '5': 9, '10': 'gender'},
    {'1': 'age', '3': 6, '4': 1, '5': 5, '10': 'age'},
    {'1': 'role', '3': 7, '4': 1, '5': 9, '10': 'role'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSGgoIdXNlcm5hbW'
    'UYAyABKAlSCHVzZXJuYW1lEhQKBXBob25lGAQgASgJUgVwaG9uZRIWCgZnZW5kZXIYBSABKAlS'
    'BmdlbmRlchIQCgNhZ2UYBiABKAVSA2FnZRISCgRyb2xlGAcgASgJUgRyb2xlEh0KCmNyZWF0ZW'
    'RfYXQYCCABKAlSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use parentChildDescriptor instead')
const ParentChild$json = {
  '1': 'ParentChild',
  '2': [
    {'1': 'parent_id', '3': 1, '4': 1, '5': 9, '10': 'parentId'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `ParentChild`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parentChildDescriptor = $convert.base64Decode(
    'CgtQYXJlbnRDaGlsZBIbCglwYXJlbnRfaWQYASABKAlSCHBhcmVudElkEhkKCGNoaWxkX2lkGA'
    'IgASgJUgdjaGlsZElkEh0KCmNyZWF0ZWRfYXQYAyABKAlSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = {
  '1': 'Device',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'user_agent', '3': 4, '4': 1, '5': 9, '10': 'userAgent'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode(
    'CgZEZXZpY2USDgoCaWQYASABKAlSAmlkEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZBIbCglkZX'
    'ZpY2VfaWQYAyABKAlSCGRldmljZUlkEh0KCnVzZXJfYWdlbnQYBCABKAlSCXVzZXJBZ2VudBId'
    'CgpjcmVhdGVkX2F0GAUgASgJUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = {
  '1': 'RefreshToken',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'token_hash', '3': 4, '4': 1, '5': 9, '10': 'tokenHash'},
    {'1': 'expires_at', '3': 5, '4': 1, '5': 9, '10': 'expiresAt'},
    {'1': 'revoked', '3': 6, '4': 1, '5': 8, '10': 'revoked'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode(
    'CgxSZWZyZXNoVG9rZW4SDgoCaWQYASABKAlSAmlkEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZB'
    'IbCglkZXZpY2VfaWQYAyABKAlSCGRldmljZUlkEh0KCnRva2VuX2hhc2gYBCABKAlSCXRva2Vu'
    'SGFzaBIdCgpleHBpcmVzX2F0GAUgASgJUglleHBpcmVzQXQSGAoHcmV2b2tlZBgGIAEoCFIHcm'
    'V2b2tlZBIdCgpjcmVhdGVkX2F0GAcgASgJUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'gender', '3': 4, '4': 1, '5': 9, '10': 'gender'},
    {'1': 'age', '3': 5, '4': 1, '5': 5, '10': 'age'},
    {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'role', '3': 7, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGA'
    'IgASgJUgVlbWFpbBIUCgVwaG9uZRgDIAEoCVIFcGhvbmUSFgoGZ2VuZGVyGAQgASgJUgZnZW5k'
    'ZXISEAoDYWdlGAUgASgFUgNhZ2USGgoIcGFzc3dvcmQYBiABKAlSCHBhc3N3b3JkEhIKBHJvbG'
    'UYByABKAlSBHJvbGU=');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'user_agent', '3': 4, '4': 1, '5': 9, '10': 'userAgent'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZBIbCglkZXZpY2VfaWQYAyABKAlSCGRldmljZUlkEh0KCnVzZXJfYWdl'
    'bnQYBCABKAlSCXVzZXJBZ2VudA==');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USIQoMYWNjZXNzX3Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIjCg1yZW'
    'ZyZXNoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklk'
    'EhIKBHJvbGUYBCABKAlSBHJvbGU=');

@$core.Deprecated('Use checkUserRequestDescriptor instead')
const CheckUserRequest$json = {
  '1': 'CheckUserRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `CheckUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserRequestDescriptor = $convert.base64Decode(
    'ChBDaGVja1VzZXJSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbg==');

@$core.Deprecated('Use checkUserResponseDescriptor instead')
const CheckUserResponse$json = {
  '1': 'CheckUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `CheckUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserResponseDescriptor = $convert.base64Decode(
    'ChFDaGVja1VzZXJSZXNwb25zZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSEgoEcm9sZRgCIA'
    'EoCVIEcm9sZQ==');

@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = {
  '1': 'LogoutRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dvdXRSZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbg==');

@$core.Deprecated('Use getProfileRequestDescriptor instead')
const GetProfileRequest$json = {
  '1': 'GetProfileRequest',
};

/// Descriptor for `GetProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQcm9maWxlUmVxdWVzdA==');

@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = {
  '1': 'LogoutResponse',
  '2': [
    {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert.base64Decode(
    'Cg5Mb2dvdXRSZXNwb25zZRIOCgJvaxgBIAEoCFICb2s=');

