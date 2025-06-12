import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/service/locator_ser.dart';
import 'package:sharecars/core/test/my_test.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';
import 'package:sharecars/features/auth/presentation/manger/forget_password_cubit/forget_password_cubit.dart';
import 'package:sharecars/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:sharecars/features/auth/presentation/manger/singin_cubit/singin_cubit.dart';
import 'package:sharecars/features/auth/presentation/view/forget_password.dart';
import 'package:sharecars/features/auth/presentation/view/login.dart';
import 'package:sharecars/features/auth/presentation/view/singin.dart';
import 'package:sharecars/features/profiles/data/repo/profile_repo_im.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/profile.dart';
import 'package:sharecars/features/splash_view/presentaion/view/splash_view.dart';

List<GetPage<dynamic>> appRoute = [
  GetPage(name: RouteName.splashView, page: () => const SplashView()),
  GetPage(name: RouteName.test, page: () => const MyTest()),
  GetPage(
    name: RouteName.login,
    page: () => BlocProvider(
      create: (context) => LoginCubit(getit.get<AuthRepoIm>()),
      child: const Login(),
    ),
  ),
  GetPage(
      name: RouteName.singin,
      page: () => BlocProvider(
            create: (context) => SinginCubit(getit.get<AuthRepoIm>()),
            child: const Singin(),
          )),
  GetPage(
    name: RouteName.forgetpassword,
    page: () => BlocProvider(
      create: (context) => ForgetPasswordCubit(getit.get<AuthRepoIm>()),
      child: const ForgetPassword(),
    ),
  ),
  GetPage(
      name: RouteName.profile,
      page: () => BlocProvider(
            create: (context) => ProfileCubit(ProfileRepoIm()),
            child: const Profile(),
          )),
];