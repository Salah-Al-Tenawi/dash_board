import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';

// ignore: must_be_immutable
class CustomTextformfild extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? Function(String?)? validator;
  void Function(String)? onFieldSubmitted;
  String title;
  Icon? icon;
  Widget? suffix;
  bool? scureText;
  TextInputType? keyboardType;
  String? hint;
  double? height;
  double? width;

  CustomTextformfild(
      {super.key,
      this.height,
      this.width,
      required this.title,
      this.controller,
      this.icon,
      this.suffix,
      this.onFieldSubmitted,
      required this.validator,
      this.keyboardType,
      this.scureText,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: keyboardType,
        obscureText: scureText == null || scureText == false ? false : true,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.primary)),
            hintText: hint,
            suffix: suffix,
            fillColor: MyColors.beige,
            labelText: title,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: MyColors.blackColor,
            ),
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: icon,
            prefixIconColor: MyColors.primaryBackground),
      ),
    );
  }
}
