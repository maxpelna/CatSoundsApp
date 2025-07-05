import 'package:chili_debug_view/chili_debug_view.dart';
import 'package:dio/dio.dart';

final class DioFactory {
  const DioFactory();

  Dio create({
    required String baseUrl,
    required bool enableLogging,
    required bool enableDebugView,
    required List<Interceptor> interceptors,
  }) {
    const dioTimeout = Duration(seconds: 30);
    final dio = Dio(
      BaseOptions(
        connectTimeout: dioTimeout,
        receiveTimeout: dioTimeout,
        sendTimeout: dioTimeout,
        baseUrl: baseUrl,
        headers: {
          Headers.acceptHeader: Headers.jsonContentType,
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
      ),
    );

    // Add custom interceptors.
    dio.interceptors.addAll(interceptors);

    if (enableDebugView) {
      dio.interceptors.add(NetworkLoggerInterceptor());
    }

    if (enableLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
