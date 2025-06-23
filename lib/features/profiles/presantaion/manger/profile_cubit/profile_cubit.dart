import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecars/core/utils/functions/get_userid.dart';
import 'package:sharecars/features/profiles/data/model/enum/profile_mode.dart';

import 'package:sharecars/features/profiles/data/repo/profile_repo_im.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoIm profileRepoIm;

  ProfileCubit(this.profileRepoIm) : super(ProfileInitialState());

  Future<ProfileEntity> showOtherProfile(int userid) async {
    emit(ProfileLoadingState());
    final response = await profileRepoIm.showProfile(userid);

    return response.fold(
      (error) {
        emit(ProfileErorrState(message: error.message));
        throw Exception(error.message);
      },
      (profileEntity) {
        emit(ProfileloadedState(ProfileMode.otherView,
            profileEntity: profileEntity));
        return profileEntity;
      },
    );
  }

  Future<ProfileEntity> showMyProfile() async {
    int? myId = myid();
    emit(ProfileLoadingState());
    final response = await profileRepoIm.showProfile(myId!);

    return response.fold(
      (error) {
        emit(ProfileErorrState(message: error.message));
        throw Exception(error.message);
      },
      (myProfile) {
        emit(ProfileloadedState(ProfileMode.myView, profileEntity: myProfile));
        return myProfile;
      },
    );
  }

  editMyProfile() {
    final current = state;
    if (current is ProfileloadedState) {
      emit(ProfileloadedState(
        ProfileMode.myEdit,
        profileEntity: current.profileEntity,
      ));
    }
  }

  void saveMyProfile() async {
    if (state is ProfileloadedState) { 
      
    }

    emit(ProfileLoadingState());
    // to do
    // final response = await profileRepoIm.updateProfile();
    // response.fold((error) {
    //   emit(ProfileErorrState(message: error.message));
    // },
    // (profileModel) {
    // emit(ProfileloadedState(
    //   ProfileMode.myEdit,
    //   profileModel: profileModel,
    // ));
    // });
  }
}
