import 'package:dio/dio.dart';

class DioInterceptorMain extends Interceptor {
  DioInterceptorMain();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
