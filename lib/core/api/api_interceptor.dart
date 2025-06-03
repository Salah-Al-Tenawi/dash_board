import 'package:dio/dio.dart';

class ApiInterCeptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = "application/json";
    super.onRequest(options, handler);
  }
}
