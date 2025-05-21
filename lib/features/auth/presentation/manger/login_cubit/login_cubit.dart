import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepoIm authRepoIm;
  LoginCubit(this.authRepoIm) : super(LoginInitial());

  login(String email, String password) async {
    emit(LoginLoading());
    final response = await authRepoIm.login(email, password);
    response.fold((error) {
      emit(LoginError(error.message));
    }, (user) {
      emit(LoginSuccess());
    });
  }

  loginWithGoogle() {}

  emitgotoSingin() {
    emit(LoginNavigateToSignup());
    emit(LoginInitial());
  }

  emitGotoForgetPassword() {
    emit(LoginNavigationToForgetPassword());
    emit(LoginInitial());
  }
}
