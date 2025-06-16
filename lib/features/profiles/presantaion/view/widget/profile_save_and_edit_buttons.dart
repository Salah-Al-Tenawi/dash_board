import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';

class ProfileSaveAndEditButtons extends StatelessWidget {
  const ProfileSaveAndEditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileloadedState) {
          switch (state.mode) {
            case ProfileMode.myView:
              Align(
                alignment: Alignment.topRight,
                child: MyButton(
                    onPressed: () {
                      context.read<ProfileCubit>().editMyProfile();
                    },
                    child: const Icon(
                      Icons.edit,
                      color: MyColors.primary,
                      size: 20,
                    )),
              );
            case ProfileMode.myEdit:
              return Align(
                alignment: Alignment.topRight,
                child: MyButton(
                    color: MyColors.primaryText,
                    borderRadius: true,
                    width: 80.w,
                    onPressed: () {
                      context.read<ProfileCubit>().saveMyProfile();
                    },
                    child: const Text(
                      "حفظ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: MyColors.greyTextField),
                    )),
              );

            case ProfileMode.otherView:
              return const SizedBox();
          }
        }

        return const SizedBox();
      },
    );
  }
}
