import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/trip_create/data/model/trip_from.dart';

class TripDidYouBack extends StatefulWidget {
  const TripDidYouBack({super.key});

  @override
  State<TripDidYouBack> createState() => _TripDidYouBackState();
}

class _TripDidYouBackState extends State<TripDidYouBack> {
  // late final TripFrom tripFrom;
  @override
  void initState() {
    super.initState();
    // tripFrom = Get.arguments as TripFrom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Column(
            children: [
              const Text(
                "تم إنشاء الرحلة بنجاح ",
                style: font18boldramdi,
              ),
              SizedBox(
                height: 30.h,
              ),
              const FaIcon(
                FontAwesomeIcons.circleCheck,
                size: 150,
                color: MyColors.newrskey,
              ),
              SizedBox(
                height: 100.h,
              ),
              const Text(
                "هل ترغب بإنشاء رحلة عودة من الوجهة الحالية ",
                style: font14boldblueblack,
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    onPressed: () {},
                    color: MyColors.newrskey,
                    splashcolor: MyColors.newramadi,
                    width: 120.w,
                    height: 50,
                    borderRadius: true,
                    child: const Text(
                      "نعم ",
                      style: font12boldRamadi,
                    ),
                  ),
                  MyButton(
                    onPressed: () {
                      Get.toNamed(RouteName.home);
                    },
                    color: MyColors.newramadi,
                    splashcolor: MyColors.newramadi,
                    width: 120.w,
                    height: 50,
                    borderRadius: true,
                    child: const Text(
                      "لا شكراً ",
                      style: font12boldsky,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
