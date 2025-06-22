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

  showOtherProfile(int userid) async {
    emit(ProfileLoadingState());
    final response = await profileRepoIm.showProfile(userid);
    response.fold((error) {
      emit(ProfileErorrState(message: error.message));
    }, (profileEntity) {
      emit(ProfileloadedState(ProfileMode.otherView,
          profileEntity: profileEntity));
    });
  }

  showMyProfile() async {
    int ?myId = myid();
    emit(ProfileLoadingState());
    final response = await profileRepoIm.showProfile(myId!);
    response.fold((error) {
      emit(ProfileErorrState(message: error.message));
    }, (myProfile) {
      emit(ProfileloadedState(ProfileMode.myView, profileEntity: myProfile));
    });
  }

  editMyProfile() {
    final current = state;
    // if (current is ProfileloadedState) {
    //   emit(ProfileloadedState(
    //     ProfileMode.myEdit,
    //     profileModel: current.profileModel,
    //   ));
    // }
  }

  void saveMyProfile() async {
    if (state is ProfileloadedState) {}

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
