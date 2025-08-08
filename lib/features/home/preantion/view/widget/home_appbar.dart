import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/utils/widgets/custom_badge.dart';

class HomeAppBard extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.primary,
      actions: [
        CustomBadge(
          badgeColor: MyColors.accent,
          icon: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Text(
              "10",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          border: true,
          child: InkWell(
            onTap: () {
              // controller.gotoMYchat();
            },
            child: Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h, right: 8.w),
              width: 35.w,
              height: 45.h,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(5, 5),
                    color: MyColors.blackColor)
              ], shape: BoxShape.circle, color: MyColors.primaryBackground),
              child: const Icon(Icons.chat),
            ),
          ),
        ),
        CustomBadge(
          badgeColor: MyColors.accent,
          icon: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
            child: Text(
              "10",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          border: true,
          child: InkWell(
            onTap: () {
              // controller.gotoMynotifications();
            },
            child: Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h, right: 1.w),
              width: 35.w,
              height: 45.h,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(5, 5),
                      color: MyColors.blackColor)
                ],
                borderRadius: BorderRadius.circular(30.sp),
                color: MyColors.primaryBackground,
              ),
              child: const Icon(Icons.notifications),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
