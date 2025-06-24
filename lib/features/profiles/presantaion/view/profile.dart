import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sharecars/core/utils/functions/get_userid.dart';
import 'package:sharecars/core/utils/widgets/loading_widget_size_150.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_body.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_erorr.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<ProfileEntity> _loadProfileFuture;
  late ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = context.read<ProfileCubit>();

    final userId = 26;
    // final userId = Get.arguments as int;

    _loadProfileFuture = _fetchProfileData(userId);
  }

  Future<ProfileEntity> _fetchProfileData(int userId) async {
    final currentUserid = myid();
    if (userId == currentUserid) {
      return await _profileCubit.showMyProfile();
    } else {
      return await _profileCubit.showOtherProfile(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: FutureBuilder<ProfileEntity>(
          future: _loadProfileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidgetSize150();
            }

            if (snapshot.hasError || snapshot.data == null) {
              return ProfileErrorWidget(
                onRetry: () {
                  setState(() {
                    _loadProfileFuture =
                        _fetchProfileData(Get.arguments as int);
                  });
                },
              );
            }

            return ProfileBody(profileEntity: snapshot.data!);
          },
        ),
      ),
    );
  }
}
