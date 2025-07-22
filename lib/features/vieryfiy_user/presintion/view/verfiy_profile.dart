import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/them/text_style_app.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/vieryfiy_user/presintion/manger/cubit/verfiy_user_cubit.dart';

class VerfiyProfile extends StatefulWidget {
  const VerfiyProfile({super.key});

  @override
  State<VerfiyProfile> createState() => _VerfiyProfileState();
}

class _VerfiyProfileState extends State<VerfiyProfile> {
  bool isDriver =false;
   
   @override
  void initState() {
    // isDriver = 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحقق من الهوية')),
      body: BlocBuilder<VerifyProfileCubit, void>(
        builder: (context, _) {
          final cubit = context.read<VerifyProfileCubit>();

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // _buildImageTile(context, 'صورة الهوية الوجه الأمامي',
                  //     cubit.frontIdImage, cubit.pickFrontId),
                  // _buildImageTile(context, 'صورة الهوية الوجه الخلفي',
                  //     cubit.backIdImage, cubit.pickBackId),
                  // _buildImageTile(context, 'صورة رخصة القيادة',
                  //     cubit.driverLicenseImage, cubit.pickDriverLicense),
                  // _buildImageTile(context, 'صورة ميكانيك السيارة',
                  //     cubit.mechanicImage, cubit.pickMechanic),
                  SizedBox(height: 20.h),
                  MyButton(
                    onPressed: () {
                      if (cubit.allImagesSelected(isDriver)) {
                        cubit.submitImages();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('الرجاء اختيار كل الصور')),
                        );
                      }
                    },
                    color: MyColors.primary,
                    height: 50.h,
                    width: 100.w,
                    child: const Text("موافق", style: font13normaldgrey),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageTile(
    BuildContext context,
    String label,
    File? image,
    Future<void> Function() onTap,
  ) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 10.h),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 250.w,
            height: 250.h,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(image, fit: BoxFit.cover),
                  )
                : const Icon(Icons.add_a_photo, size: 40),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
