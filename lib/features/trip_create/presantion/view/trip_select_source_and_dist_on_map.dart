import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/trip_create/data/model/trip_from.dart';

class TripSelectSourceAndDistOnMap extends StatefulWidget {
  const TripSelectSourceAndDistOnMap({super.key});

  @override
  State<TripSelectSourceAndDistOnMap> createState() =>
      _TripSelectSourceAndDestOnMapState();
}

class _TripSelectSourceAndDestOnMapState
    extends State<TripSelectSourceAndDistOnMap> {
  late TripFrom tripFrom;
  @override
  void initState() {
    super.initState();
    tripFrom = TripFrom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsetsGeometry.symmetric(horizontal: 30.w, vertical: 100.w),
        child: Column(
          children: [
            const Text("حدد موقع انطلاق و وجهة الرحلة و المسار على الخريطة"),
            SizedBox(
              height: 30.h,
            ),
            const FaIcon(FontAwesomeIcons.mapLocationDot,
                size: 40, color: Colors.redAccent),
            SizedBox(
              height: 70.h,
            ),
            MyButton(
              onPressed: () {},
              color: MyColors.newrskey,
              width: 200.w,
              height: 60.h,
              child: const Text(
                "الانطلاق",
                style: font13boldbluedark,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 13.h),
              child: const FaIcon(
                FontAwesomeIcons.route,
                size: 40,
                color: MyColors.newramadi,
              ),
            ),
            MyButton(
              onPressed: () {},
              color: MyColors.newrskey,
              width: 200.w,
              height: 60.h,
              child: const Text(
                "الوجهة",
                style: font13boldbluedark,
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 160.w),
              child: MyButton(
                onPressed: () { 
                  
                },
                color: MyColors.newramadi,
                width: 130.w,
                height: 50.h,
                borderRadius: true,
                splashcolor: MyColors.newrskey,
                child: const Text(
                  "التالي",
                  style: font13boldwhite,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
