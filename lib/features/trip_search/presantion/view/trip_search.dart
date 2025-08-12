import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/widgets/custom_text_form.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';

class TripSearch extends StatefulWidget {
  const TripSearch({super.key});

  @override
  State<TripSearch> createState() => _TripSearchState();
}

class _TripSearchState extends State<TripSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            const Text(
              "الخريطة",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: MyColors.primaryText,
              ),
            ),
            SizedBox(height: 20.h),

            // زر الخريطة
            MyButton(
              onPressed: () {
                // Get.toNamed(RouteName.pushRideMap, arguments: tripFrom);
              },
              child: const FaIcon(
                FontAwesomeIcons.mapLocationDot,
                size: 60,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 30.h),

            // حقول الإدخال
            Card(
              elevation: 2,
              color: MyColors.primaryBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
                child: Row(
                  children: [
                    MyButton(
                      onPressed: () {},
                      color: MyColors.primaryText,
                      height: 80.h,
                      width: 60.w,
                      child: const Text(
                        "التاريخ",
                        style: font13boldGreyText,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 10.w,
                    ),
                    const Expanded(
                        child: CustomTextformfild(
                      fill: true,
                      fillColor: Colors.white,
                      title: "عدد المقاعد",
                      keyboardType: TextInputType.number,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),

            MyButton(
              width: 120.w,
              color: MyColors.primary,
              height: 60.h,
              borderRadius: true,
              onPressed: () {},
              child: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
                color: MyColors.primaryBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
