part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileErorrState extends ProfileState {
  final String message;
  const ProfileErorrState({required this.message});
}

final class ProfileloadedState extends ProfileState {
  final ProfileEntity profileEntity;
  final ProfileMode mode;
  const ProfileloadedState(this.mode, {required this.profileEntity});
}
