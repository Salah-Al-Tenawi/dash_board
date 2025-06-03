import 'package:get_it/get_it.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:sharecars/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';

final getit = GetIt.instance;

locatorService() {
  getit.registerSingleton<DioConSumer>(DioConSumer());
  getit.registerSingleton<AuthRemoteDataSourceIM>(
      AuthRemoteDataSourceIM(api: getit.get<DioConSumer>()));
  getit.registerSingleton<AuthLocalDataSourceIm>(AuthLocalDataSourceIm());
  getit.registerSingleton<AuthRepoIm>(
    AuthRepoIm(
      authRemoteDataSource: getit.get<AuthRemoteDataSourceIM>(),
      authLocalDataSourceIm: getit.get<AuthLocalDataSourceIm>(),
    ),
  );
}
