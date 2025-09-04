import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:sharecars/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sharecars/features/auth/data/model/admin_model.dart';

import 'package:sharecars/features/auth/domain/repo/auth_repo.dart';

class AuthRepoIm extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoIm({
    required this.authRemoteDataSource,
  });
  
@override
Future<void> getCsrfCookie() async {
  try {
    await authRemoteDataSource.getCsrfCookie(); 
  } on ServerExpcptions catch (e) {
    print('CSRF fetch failed: ${e.error}');
    rethrow; 
  }
}
  @override
  Future<Either<Filuar, AdminModel>> adminlogin(String email, String password) async {
    try {
      final user = await authRemoteDataSource.adminlogin(email, password);
      
      return right(user);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    }
  }
  
  @override
  Future<Either<Filuar, AdminModel>> sycachlogin(String email, String password) async {
    try {
      final admin = await authRemoteDataSource.sycachlogin(email, password);
      
      return right(admin);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    }
  }

}
