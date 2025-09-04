import 'package:dio/dio.dart';

class ApiInterCeptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = "application/json";
    // options.headers['Content-Type'] = "application/x-www-form-urlencoded";
    super.onRequest(options, handler);
  }
}
