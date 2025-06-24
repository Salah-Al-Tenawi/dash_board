import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_car.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_contact_me.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_hintline.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_image_and_name.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_rating.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_save_and_edit_buttons.dart';

class ProfileBody extends StatefulWidget {
  final ProfileEntity profileEntity;

  const ProfileBody({super.key, required this.profileEntity});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController? controllerEditAboutMe;
  ProfileEntity? _profileCopyWithEdit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadedState && state.mode == ProfileMode.myEdit) {
          _profileCopyWithEdit = widget.profileEntity;
          controllerEditAboutMe =
              TextEditingController(text: widget.profileEntity.description);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primaryBackground,
          actions: [
            ProfileSaveAndEditButtons(
              profileEntityWithEdit: _profileCopyWithEdit,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(children: [
                  ProfileImageAndName(
                    verification: widget.profileEntity.verification,
                    name: widget.profileEntity.fullname,
                    imageurl: widget.profileEntity.profilePhoto,
                    profileEntitYEdit: _profileCopyWithEdit,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileRating(
                          totalRating: widget.profileEntity.totalRating,
                          averageRating: widget.profileEntity.averageRating,
                          tripsCount: widget.profileEntity.numberOfides,
                        ),
                        Text(widget.profileEntity.address,
                            style: font13boldNewRamadi),
                        const ProfileContactMe()
                      ]),
                  ProfileHintline(
                    hintLine: widget.profileEntity.description,
                    controllerAboutme: controllerEditAboutMe,
                    profileCopyWithEdit: _profileCopyWithEdit,
                  ),
                  widget.profileEntity.car != null
                      ? ProfileCar(
                          car: widget.profileEntity.car!,
                          carWitheidt:_profileCopyWithEdit?.car,

                        )
                      : const SizedBox(),
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
                  // ProfileComments(
                  //   feadBack: widget.profileEntity.comments,
                  // ),
                ])),
          ),
        ),
      ),
    );
  }
}
