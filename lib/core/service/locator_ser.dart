import 'package:get_it/get_it.dart';
import 'package:sharecars/core/api/dio_consumer.dart';

// Auth
import 'package:sharecars/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:sharecars/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';
import 'package:sharecars/features/auth/domain/repo/auth_repo.dart';

// Report
import 'package:sharecars/features/report/data/data_source/report_remote_data_source.dart';
import 'package:sharecars/features/report/data/repo/report_repo_im.dart';
import 'package:sharecars/features/report/domain/repo/auth_repo.dart';

// Wallet
import 'package:sharecars/features/wallet/data/data_source/wallet_remote_data_source.dart' ;
import 'package:sharecars/features/wallet/data/repo/wallet_repo_im.dart';
import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';

final getit = GetIt.instance;

void locatorService() {
  // Dio
  getit.registerSingleton<DioConSumer>(DioConSumer());

  // ✅ Auth
  getit.registerSingleton<AuthRemoteDataSourceIM>(
    AuthRemoteDataSourceIM(api: getit.get<DioConSumer>()),
  );
  getit.registerSingleton<AuthLocalDataSourceIm>(AuthLocalDataSourceIm());
  getit.registerSingleton<AuthRepoIm>(
    AuthRepoIm(
      authRemoteDataSource: getit.get<AuthRemoteDataSourceIM>(),
    ),
  );

  // ✅ Report
  getit.registerSingleton<ReportRemoteDataSource>(
    ReportRemoteDataSourceIM(api: getit.get<DioConSumer>()),
  );
  getit.registerSingleton<ReportRepo>(
    ReportRepoIm(
      reportRemoteDataSource: getit.get<ReportRemoteDataSource>(),
    ),
  );

  // ✅ Wallet
  getit.registerSingleton<WalletRemoteDataSource>(
    WalletRemoteDataSourceIM(api: getit.get<DioConSumer>()),
  );
  getit.registerSingleton<WalletRepo>(
    WalletRepoIm(
      walletRemoteDataSource: getit.get<WalletRemoteDataSource>(),
    ),
  );
}
