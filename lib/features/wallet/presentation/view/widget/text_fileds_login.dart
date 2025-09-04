import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/utils/functions/input_valid.dart';
import 'package:sharecars/core/utils/widgets/custom_text_form.dart';

class TextFieldsLogin extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;

  const TextFieldsLogin({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fieldWidth = width > 600 ? 500.w : width * 0.8; // responsive width

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextformfild(
          width: fieldWidth,
          validator: (val) => inputvaild(val!, "email", 20, 10),
          keyboardType: TextInputType.emailAddress,
          icon: const Icon(Icons.email_outlined),
          hint: "example@gmail.com",
          title: "البريد الإلكتروني",
          controller: email,
        ),
        SizedBox(height: 20.h),
        CustomTextformfild(
          width: fieldWidth,
          validator: (val) => inputvaild(val!, "password", 35, 8),
          keyboardType: TextInputType.visiblePassword,
          scureText: true,
          icon: const Icon(Icons.lock_clock_outlined),
          title: "كلمة المرور",
          controller: password,
        ),
       
        SizedBox(height: 20.h),
      ],
    );
  }
}
