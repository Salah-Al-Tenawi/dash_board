import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';
import 'package:sharecars/core/utils/functions/input_valid.dart';
import 'package:sharecars/core/utils/widgets/custom_text_form.dart';
import 'package:sharecars/core/utils/widgets/cutom_list_tile.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';

class ProfileHintline extends StatelessWidget {
  final String hintLine;
  final TextEditingController? controllerAboutme;
  const ProfileHintline(
      {super.key, required this.hintLine, required this.controllerAboutme});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileloadedState) {
          switch (state.mode) {
            case ProfileMode.myEdit:
              // to do
              CustomTextformfild(
                title: "",
                validator: (val) => inputvaild(val!, "descrption", null, null),
                controller: controllerAboutme,
              );
            case ProfileMode.myView:
            case ProfileMode.otherView:
              return CustomListTile(
                title: "نبذة عني",

                margin: EdgeInsets.symmetric(vertical: 20.h),
                // color: MyColors.beige,
                // trailing: Iconst

                isThreeLine: true,
                titleTextStyle: font15BoldRamadi,
                subtitle: Text(
                    style: const TextStyle(color: MyColors.greyTextColor),
                    hintLine),
              );
          }
        }
        return const SizedBox();
      },
    );
  }
}
