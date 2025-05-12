import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Filuar, UserModel>> singin(
      String firstName,
      String lastName,
      String gender,
      String email,
      String address,
      String password,
      String verfiyPassword);

  Future<Either<Filuar, UserModel>> login(String email, String password);
// to do return type
  
}
