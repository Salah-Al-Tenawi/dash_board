import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';

import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/presantaion/manger/profile_cubit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/Profile_car_info_edit.dart';
import 'package:sharecars/features/profiles/presantaion/view/widget/profile_car_info_view.dart';

class ProfileCar extends StatelessWidget {
  final CarEntity car; 
  final CarEntity ?carWitheidt; 
  
  const ProfileCar({
    super.key,
    required this.car,
    required this.carWitheidt
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          switch (state.mode) {
            case ProfileMode.otherView:
            case ProfileMode.myView:
              return ProfileCarInfoView(car: car);

            case ProfileMode.myEdit:
              return ProfileCarINfoEdit(
                carWithEdit: carWitheidt,
              );
          }
        }

        return const SizedBox();
      },
    );
  }
}
