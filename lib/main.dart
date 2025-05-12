import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sharecars/core/route/route_app.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/them/them_app.dart';

void main() {
  runApp(const ShareCars());
}

class ShareCars extends StatelessWidget {
  const ShareCars({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "app for share cars with people",
      initialRoute: RouteName.splashView,
      getPages: appRoute,
      theme: ThemApp.lightThem,
      
      debugShowCheckedModeBanner: false,
    );
  }
}
