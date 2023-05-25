import 'package:dio/dio.dart';
import 'package:sample_article_flutter/network/misc/dio_custom_response.dart';

class DioClient {
  final Dio _dio = Dio();

  Dio get dioObject => _dio;

  DioClient.init(String baseUrl) {
    _dio.options
      ..baseUrl = baseUrl
      ..sendTimeout = const Duration(milliseconds: 30000)
      ..receiveTimeout = const Duration(milliseconds: 30000)
      ..connectTimeout = const Duration(milliseconds: 30000);
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  Future<DioCustomResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return DioCustomResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DioCustomResponse> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return DioCustomResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }
}
