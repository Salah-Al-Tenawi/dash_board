import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sharecars/core/constant/imagesUrl.dart';
import 'package:sharecars/core/service/hive_services.dart';
import 'package:sharecars/core/utils/widgets/my_button.dart';
import 'package:sharecars/features/auth/data/model/user_model.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_body.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<ProfileEntity> _loadProfileFuture;
  late ProfileCubit _profileCubit;

  @override
  void initState() async {
    super.initState();
    _profileCubit = context.read<ProfileCubit>();
    final userId = Get.arguments as int;

    _loadProfileFuture = _fetchProfileData(userId);
  }

  int? getCurrentUserID() {
    final currentUser = HiveBoxes.authBox.get(HiveKeys.user) as UserModel?;
    return currentUser?.id;
  }

  Future<ProfileEntity> _fetchProfileData(int userId) async {
    final currentUserid = getCurrentUserID();
    if (userId == currentUserid) {
      return await _profileCubit.showMyProfile();
    } else {
      return await _profileCubit.showOtherProfile(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProfileEntity>(
        future: _loadProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset(
                ImagesUrl.loadinglottie,
                width: 150.w,
                height: 150.h,
                fit: BoxFit.contain,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'حدث خطأ: ${snapshot.error}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  MyButton(
                    onPressed: () {
                      setState(() {
                        _loadProfileFuture =
                            _fetchProfileData(Get.arguments as int);
                      });
                    },
                    width: 150.w,
                    height: 45.h,
                    borderRadius: true,
                    child: const Text("أعد المحاولة"),
                  ),
                ],
              ),
            );
          }
          return ProfileBody(
            profileEntity: snapshot.data!,
          );
        },
      ),
    );
  }
}
