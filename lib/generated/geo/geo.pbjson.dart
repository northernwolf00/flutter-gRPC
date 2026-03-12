// This is a generated file - do not edit.
//
// Generated from geo.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use locationPointDescriptor instead')
const LocationPoint$json = {
  '1': 'LocationPoint',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
    {'1': 'accuracy', '3': 3, '4': 1, '5': 1, '10': 'accuracy'},
    {'1': 'speed', '3': 4, '4': 1, '5': 1, '10': 'speed'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `LocationPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationPointDescriptor = $convert.base64Decode(
    'Cg1Mb2NhdGlvblBvaW50EhAKA2xhdBgBIAEoAVIDbGF0EhAKA2xuZxgCIAEoAVIDbG5nEhoKCG'
    'FjY3VyYWN5GAMgASgBUghhY2N1cmFjeRIUCgVzcGVlZBgEIAEoAVIFc3BlZWQSHAoJdGltZXN0'
    'YW1wGAUgASgDUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use streamLocationResponseDescriptor instead')
const StreamLocationResponse$json = {
  '1': 'StreamLocationResponse',
  '2': [
    {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `StreamLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamLocationResponseDescriptor = $convert.base64Decode(
    'ChZTdHJlYW1Mb2NhdGlvblJlc3BvbnNlEg4KAm9rGAEgASgIUgJvaw==');

@$core.Deprecated('Use getLocationsRequestDescriptor instead')
const GetLocationsRequest$json = {
  '1': 'GetLocationsRequest',
};

/// Descriptor for `GetLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsRequestDescriptor = $convert.base64Decode(
    'ChNHZXRMb2NhdGlvbnNSZXF1ZXN0');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'lat', '3': 2, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 3, '4': 1, '5': 1, '10': 'lng'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSEAoDbGF0GAIgASgBUgNsYXQSEA'
    'oDbG5nGAMgASgBUgNsbmc=');

@$core.Deprecated('Use getLocationsResponseDescriptor instead')
const GetLocationsResponse$json = {
  '1': 'GetLocationsResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.geo.Location', '10': 'locations'},
  ],
};

/// Descriptor for `GetLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsResponseDescriptor = $convert.base64Decode(
    'ChRHZXRMb2NhdGlvbnNSZXNwb25zZRIrCglsb2NhdGlvbnMYASADKAsyDS5nZW8uTG9jYXRpb2'
    '5SCWxvY2F0aW9ucw==');

@$core.Deprecated('Use getNearbyRequestDescriptor instead')
const GetNearbyRequest$json = {
  '1': 'GetNearbyRequest',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
    {'1': 'radius_km', '3': 3, '4': 1, '5': 1, '10': 'radiusKm'},
  ],
};

/// Descriptor for `GetNearbyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNearbyRequestDescriptor = $convert.base64Decode(
    'ChBHZXROZWFyYnlSZXF1ZXN0EhAKA2xhdBgBIAEoAVIDbGF0EhAKA2xuZxgCIAEoAVIDbG5nEh'
    'sKCXJhZGl1c19rbRgDIAEoAVIIcmFkaXVzS20=');

@$core.Deprecated('Use getNearbyResponseDescriptor instead')
const GetNearbyResponse$json = {
  '1': 'GetNearbyResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.geo.Location', '10': 'locations'},
  ],
};

/// Descriptor for `GetNearbyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNearbyResponseDescriptor = $convert.base64Decode(
    'ChFHZXROZWFyYnlSZXNwb25zZRIrCglsb2NhdGlvbnMYASADKAsyDS5nZW8uTG9jYXRpb25SCW'
    'xvY2F0aW9ucw==');

