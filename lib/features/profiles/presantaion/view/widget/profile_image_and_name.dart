import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';
import 'package:sharecars/core/utils/functions/show_image.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_verification_icon.dart';

class ProfileImageAndName extends StatelessWidget {
  final String? imageurl;
  final String name;
  final String verification;
  const ProfileImageAndName(
      {super.key,
      required this.imageurl,
      required this.name,
      required this.verification});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Align(
        alignment: Alignment.topLeft,
        child:
            BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          if (state is ProfileloadedState) {
            switch (state.mode) {
              case ProfileMode.myEdit:
                return MyButton(
                  splashcolor: Colors.white,
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      // context.read<ProfileCubit>().pickImage(pickedFile);
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: MyColors.primary,
                    maxRadius: 45,
                    backgroundImage: AssetImage(ImagesUrl.profileImage),
                  ),
                );
              case ProfileMode.myView:
              case ProfileMode.otherView:
                return MyButton(
                  splashcolor: Colors.white,
                  onPressed: () {
                    openImage(
                        imageurl == null ? ImagesUrl.profileImage : imageurl!);
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.primary,
                    maxRadius: 45,
                    backgroundImage: imageurl == null
                        ? const AssetImage(ImagesUrl.profileImage)
                        : NetworkImage(imageurl!) as ImageProvider,
                  ),
                );
            }
          }

          return const Text(" blocBuilder not found ant state");
        }),
      ),
      ProfileVerificationIcon(
        verification: verification,
      ),
      SizedBox(
        width: 15.w,
      ),
      Expanded(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileloadedState) {
              switch (state.mode) {
                case ProfileMode.myEdit:
                  return TextFormField(
                    // initialValue: state.name,
                    onChanged: (val) {
                      // context.read<ProfileCubit>().changeName(val);
                    },
                    decoration: const InputDecoration(
                      hintText: 'أدخل الاسم',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryText,
                    ),
                  );

                case ProfileMode.myView:
                case ProfileMode.otherView:
                  return Text(
                    name,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryText),
                  );
              }
            }

            return const Text(" blocBuilder not found ant state");
          },
        ),
      )
    ]);
  }
}
