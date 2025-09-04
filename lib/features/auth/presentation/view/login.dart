import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/features/auth/presentation/view/widget/buttons_login.dart';

import 'package:sharecars/features/auth/presentation/view/widget/text_fileds_login.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.9,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "تسجيل الدخول",
                            style: font22Primary,
                          ),
                          SizedBox(height: 40.h),
                          TextFieldsLogin(
                            email: email,
                            password: password,
                          ),
                          ColumnButtonsLogin(
                            email: email,
                            password: password,
                            formKey: formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.9,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: MyColors.primary.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: const DecorationImage(
                          image: AssetImage(ImagesUrl.appLogo),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
