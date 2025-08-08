import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/utils/functions/get_userid.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  get font15ggreyw600 => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.primaryBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomListTile(
            title: "بروفايلي",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () {
              Get.toNamed(RouteName.profile, arguments: myid());
            },
            trailing: const Icon(
              Icons.person_pin_sharp,
              color: MyColors.primaryText,
              size: 30,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          CustomListTile(
            title: "عروضي  ",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () {
              // controller.myOffers();
            },
            trailing: const Icon(
              Icons.wechat_rounded,
              color: MyColors.primaryText,
              size: 30,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          CustomListTile(
            title: "حذف حسابي",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {},
            trailing: const Icon(
              Icons.delete_outline,
              color: MyColors.primaryText,
              size: 30,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          SizedBox(
            height: 250.h,
          ),
          CustomListTile(
            title: "تسجيل الخروج",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {},
            trailing: const Icon(
              Icons.login_outlined,
              color: MyColors.primaryText,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
