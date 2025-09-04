import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/auth/data/model/admin_model.dart';
abstract class AuthRepo {
  Future<Either<Filuar, AdminModel>> adminlogin(String email, String password);
  Future<Either<Filuar, AdminModel>> sycachlogin(String email, String password);
  Future<void> getCsrfCookie();
}
