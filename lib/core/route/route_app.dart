import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/features/splash_view/presentaion/view/splash_view.dart';

 List<GetPage<dynamic>> appRoute = [ 
  GetPage(name: RouteName.splashView, page: () => const SplashView()),
// GetPage(name: NameRoute.login, page: () =>const Login()) ,
// GetPage(name: NameRoute.singin, page: ()=>const Singin())

];
 