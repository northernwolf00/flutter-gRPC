import 'dart:async';
import 'package:grpc/grpc.dart';
import 'auth_service.dart';

class AuthInterceptor extends ClientInterceptor {
  final AuthService _authService = AuthService();

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final newOptions = _addAuthHeader(options);
    return invoker(method, request, newOptions);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final newOptions = _addAuthHeader(options);
    return invoker(method, requests, newOptions);
  }

  CallOptions _addAuthHeader(CallOptions options) {
    // We can't use async here directly, so we'll need a way to get the token.
    // However, CallOptions.metadata can be provided.
    // For synchronous interception, we might need to store the token in memory
    // or use a more complex async interceptor if the gRPC library supports it.

    // In many cases, we can inject a provider or use a custom Metadata provider.
    return options.mergedWith(
      CallOptions(
        providers: [_injectToken],
      ),
    );
  }

  Future<void> _injectToken(Map<String, String> metadata, String uri) async {
    final token = await _authService.getToken();
    if (token != null && token.isNotEmpty) {
      metadata['authorization'] = 'Bearer $token';
    }
  }
}
