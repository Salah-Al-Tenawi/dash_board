import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/service/locator_ser.dart';
import 'package:sharecars/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';
import 'package:sharecars/features/auth/presentation/view/login.dart';

List<GetPage<dynamic>> appRoute = [
  GetPage(
    name: RouteName.login,
    page: () => BlocProvider(
      create: (context) => LoginCubit(getit.get<AuthRepoIm>()),
      child: const LoginAdmin(),
    ),
  ),
];
