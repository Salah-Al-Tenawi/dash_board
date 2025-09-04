import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';

part 'sycash_login_state.dart';

class SycashLoginCubit extends Cubit<SycashLoginState> {
  final AuthRepoIm authRepoIm;
  SycashLoginCubit(this.authRepoIm) : super(SycashLoginInitial());

  Future<void> login(String email, String password) async {
    emit(SycashLoginLoading());
    try {
      final response = await authRepoIm.sycachlogin(email, password);
      emit(SycashLoginSuccess());
    } catch (e) {
      emit(SycashLoginError(e.toString()));
    }
  }
}
