import 'package:flutter/material.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column( 
      children: [  
        Image.asset(ImagesUrl.appLogo)
      ],
    );
  }
}
