import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/text_app.dart';
import 'package:sharecars/core/utils/enum/profile_mode.dart';
import 'package:sharecars/features/profiles/data/model/profile_model.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_Car_ifno.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_contact_me.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_comments.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_hintline.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_image_and_name.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_rating.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_save_and_edit_buttons.dart';

class ProfileBody extends StatefulWidget {
  final ProfileModel profileModel;

  const ProfileBody({super.key, required this.profileModel});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController? controllerEditAboutMe;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileloadedState && state.mode == ProfileMode.myEdit) {
          controllerEditAboutMe = TextEditingController();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Column(children: [
                  const ProfileSaveAndEditButtons(),
                  ProfileImageAndName(
                    name: widget.profileModel.name,
                    imageurl: widget.profileModel.imageUrl,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileRating(
                          reviewsCount: widget.profileModel.reviewsCount,
                          tripsCount: widget.profileModel.tripsCount,
                        ),
                        Text(widget.profileModel.address,
                            style: font13boldNewRamadi),
                        const ProfileContactMe()
                      ]),
                  ProfileHintline(
                    hintLine: widget.profileModel.hintline,
                    controllerAboutme: controllerEditAboutMe,
                  ),
                  const Divider(
                    endIndent: 100,
                    indent: 100,
                  ),
                  widget.profileModel.carName != null &&
                          widget.profileModel.carColor != null
                      ? ProfileCarIfno(
                          name: widget.profileModel.name,
                          image: widget.profileModel.imageUrl,
                          color: widget.profileModel.carColor!,
                          seats: widget.profileModel.carSeats!,
                        )
                      : const SizedBox(),
                  const Divider(
                    endIndent: 100,
                    indent: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.comment_outlined),
                        Text(
                          "آراء الناس بي",
                          style: font15BoldRamadi,
                        ),
                      ],
                    ),
                  ),
                  ProfileComments(
                    feadBack: widget.profileModel.comments,
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
