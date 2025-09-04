import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/route/route_name.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/functions/show_my_snackbar.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';

import 'package:sharecars/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:sharecars/features/auth/presentation/manger/sycach_cubit/sycach_cubit.dart';

class ColumnButtonsLogin extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  const ColumnButtonsLogin({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double buttonWidth = width > 600 ? 70.w : 140.w;
    double buttonHeight = height > 200 ? 60.h : 40.h;

    return Column(
      children: [
        BlocConsumer<SycashLoginCubit, SycashLoginState>(
          listener: (context, state) {
            if (state is SycashLoginError) {
              showMySnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            bool isLoading = state is SycashLoginLoading;
            return isLoading
                ? Center(
                    child: LottieBuilder.asset(
                      ImagesUrl.loadinglottie,
                      height: 130.h,
                      width: 130.w,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        BlocConsumer<AdminLoginCubit, AdminLoginState>(
          listener: (context, state) {
            if (state is AdminLoginSuccess) {
              Get.offAllNamed(RouteName.home);
            } else if (state is AdminLoginError) {
              showMySnackBar(context, state.message);
            }
          },

          builder: (context, state) {
            bool isLoading = state is AdminLoginLoading;

            return isLoading
                ? Center(
                    child: LottieBuilder.asset(
                      ImagesUrl.loadinglottie,
                      height: 130.h,
                      width: 130.w,
                    ),
                  )
                : MyButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final sycashCubit = context.read<SycashLoginCubit>();
                        final adminCubit = context.read<AdminLoginCubit>();

                        await sycashCubit.login(
                          "sycash-sim@gmail.com",
                          "sycash123456",
                        );

                        await adminCubit.login(
                          email.text.trim(),
                          password.text.trim(),
                        );
                      }
                    },
                    borderRadius: true,
                    color: MyColors.primary,
                    width: buttonWidth,
                    height: buttonHeight,
                    child: Text(
                      "انطلق",
                      style: font12White,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
