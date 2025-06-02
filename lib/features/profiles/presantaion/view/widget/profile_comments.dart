import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/core/utils/functions/show_image.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/data/model/comment_model.dart';
import 'package:sharecars/features/profiles/presantaion/view/profile.dart';

class ProfileComments extends StatelessWidget {
  final List<CommentModel>? feadBack;
  const ProfileComments({super.key, required this.feadBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: MyColors.newgrey),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: feadBack?.length,
          itemBuilder: (context, counter) {
            return const Comment();
          }),
    );
  }
}

class Comment extends StatelessWidget {
  final CommentModel? commentModel;
  const Comment({super.key, this.commentModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(width: 0.3, color: MyColors.newgrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  commentModel!.userName,
                  style: font12boldRamadi,
                ),
                SizedBox(height: 5),
                Text(
                  commentModel!.message,
                  style: font10boldRamadi,
                  textDirection: TextDirection.rtl,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    commentModel!.date,
                    style: const TextStyle(
                        fontSize: 6.2,
                        fontWeight: FontWeight.bold,
                        color: MyColors.greyTextColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 10.w),
          MyButton(
            onPressed: () {
              Get.toNamed(RouteName.profile ,arguments: commentModel!.userID);
            },
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: MyColors.newrskey,
              backgroundImage: commentModel?.imageurl != null
                  ? NetworkImage(commentModel!.imageurl!)
                  : const AssetImage(ImagesUrl.profileImage),
            ),
          ),
        ],
      ),
    );
  }
}
