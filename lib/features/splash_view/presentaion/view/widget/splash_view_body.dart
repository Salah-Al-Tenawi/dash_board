import 'package:flutter/material.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column( 
      children: [  
        Image.asset(Imageurl.logo)
      ],
    );
  }
}
class Imageurl { 
static const String imagerout = "assets/images/";
static const String logo = "$imagerout logo.png";    

}