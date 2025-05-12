
import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';
import 'package:sharecars/features/auth/domain/repo/auth_repo.dart';

class AuthRepoIm extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoIm({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Filuar, UserModel>> login(String email, String password) async {
    try {
      final response = await authRemoteDataSource.login(email, password);
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.erroe);
    }
  }

  @override
  Future<Either<Filuar, UserModel>> singin(
      String firstName,
      String lastName,
      String gender,
      String email,
      String address,
      String password,
      String verfiyPassword) async {
    try {
      final response = await authRemoteDataSource.singin(firstName, lastName,
          gender, email, address, password, verfiyPassword);
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.erroe);
    }
  }
}
