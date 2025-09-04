import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/service/locator_ser.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';

import 'package:sharecars/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:sharecars/features/auth/presentation/manger/sycach_cubit/sycach_cubit.dart';
import 'package:sharecars/features/auth/presentation/view/login.dart';
import 'package:sharecars/features/home/cubit/home_nav_cubit_cubit.dart';
import 'package:sharecars/features/home/home.dart';
import 'package:sharecars/features/report/domain/repo/auth_repo.dart';
import 'package:sharecars/features/report/presentation/manger/report_cubit/report_cubit.dart';
import 'package:sharecars/features/report/presentation/view/report.dart';
import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_charge_cubit/wallet_charge_cubit.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_list_cubit/wallet_list_cubit.dart';
import 'package:sharecars/features/wallet/presentation/manger/wallet_transactions_cubit/wallet_transactions_cubit.dart';
import 'package:sharecars/features/wallet/presentation/view/wallet_charge_page.dart';
import 'package:sharecars/features/wallet/presentation/view/wallet_list_page.dart';
import 'package:sharecars/features/wallet/presentation/view/wallet_transactions_page.dart';

List<GetPage<dynamic>> appRoute = [
  GetPage(
    name: RouteName.login,
    page: () => MultiBlocProvider(
      providers: [
        BlocProvider<AdminLoginCubit>(
            create: (_) => AdminLoginCubit(getit.get<AuthRepoIm>())),
        BlocProvider<SycashLoginCubit>(
            create: (_) => SycashLoginCubit(getit.get<AuthRepoIm>())),
      ],
      child: const LoginAdmin(),
    ),
  ),

  GetPage(
    name: RouteName.home,
    page: () => MultiBlocProvider(
      providers: [
        BlocProvider<HomeNavCubit>(create: (_) => HomeNavCubit()),
      ],
      child: const HomePage(),
    ),
    
  ),
    GetPage(
    name: RouteName.report,
    page: () => MultiBlocProvider(
      providers: [
        BlocProvider<ReportCubit>(create: (_) => ReportCubit(getit.get<ReportRepo>())),
      ],
      child:  ReportPage(),
    ),
    
  ),
      /// Wallet List Page
    GetPage(
      name: RouteName.walletListPage,
      page: () => MultiBlocProvider(
        providers: [
          BlocProvider<WalletListCubit>(
            create: (_) => WalletListCubit(getit.get<WalletRepo>()),
          ),
        ],
        child: const WalletListPage(),
      ),
    ),

    /// Wallet Transactions Page
 GetPage(
  name: RouteName.walletTransactionsPage,
  page: () {
    final args = Get.arguments as Map<String, dynamic>;
    final walletId = args['walletId'] as String;

    return MultiBlocProvider(
      providers: [
        BlocProvider<WalletTransactionsCubit>(
          create: (_) => WalletTransactionsCubit(getit.get<WalletRepo>()),
        ),
      ],
      child: WalletTransactionsPage(walletId: walletId),
    );
  },
),


    /// Wallet Charge Page
    GetPage(
      name: RouteName.walletChargePage,
      page: () => MultiBlocProvider(
        providers: [
          BlocProvider<WalletChargeCubit>(
            create: (_) => WalletChargeCubit(getit.get<WalletRepo>()),
          ),
        ],
        child:  WalletChargePage(),
      ),
    ),
];
