// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/core/service/hive_services.dart';
import 'package:sharecars/features/auth/data/model/admin_model.dart';

abstract class AuthRemoteDataSource {
  final DioConSumer api;
  const AuthRemoteDataSource({
    required this.api,
  });
  Future<void> getCsrfCookie();
  Future<AdminModel> adminlogin(String email, String password);
  Future<AdminModel> sycachlogin(String email, String password);
}

class AuthRemoteDataSourceIM extends AuthRemoteDataSource {
  AuthRemoteDataSourceIM({required super.api});

  @override
  Future<void> getCsrfCookie() async {
    try {
      await api.get(
          "http://localhost:8000/sanctum/csrf-cookie"); // خطوة global، تجيب cookie
    } catch (e) {
      print('CSRF fetch error: $e');
      rethrow;
    }
  }

  @override
  Future<AdminModel> adminlogin(String email, String password) async {
    AdminModel? user;

    try {
      final response = await api.post(ApiEndPoint.login,
          header: {"application/json": " application/x-www-form-urlencoded"},
          data: {ApiKey.email: email, ApiKey.password: password});

      try {
        user = AdminModel.fromJson(response);
        HiveBoxes.authBox.put(HiveKeys.user, user.sessionId);
      } catch (e) {
        print('JSON parsing warning: $e');
        rethrow;
      }

      return user!;
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  @override
  Future<AdminModel> sycachlogin(String email, String password) async {
    final response = await api.post(ApiEndPoint.login,
        data: {ApiKey.email: email, ApiKey.password: password});
    final admin = AdminModel.fromJson(response);

    return admin;
  }
}
