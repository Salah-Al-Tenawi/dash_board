import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}