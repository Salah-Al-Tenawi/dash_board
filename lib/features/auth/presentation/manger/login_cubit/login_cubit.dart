import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/features/auth/data/repo/auth_repo_im.dart';
import 'package:sharecars/features/auth/domain/repo/auth_repo.dart';

part 'login_state.dart';

class AdminLoginCubit extends Cubit<AdminLoginState> {
  final AuthRepo authRepo;
  AdminLoginCubit(this.authRepo) : super(AdminLoginInitial());

  Future<void> login(String email, String password) async {
    emit(AdminLoginLoading());
    try {
      final response = await authRepo.adminlogin(email, password);

      print(response);
      emit(AdminLoginSuccess());
    } catch (e) {
      emit(AdminLoginError(e.toString()));
    }
  }

  Future<void> fetchCsrf() async {
    try {
      await authRepo.getCsrfCookie();
      print('CSRF fetched successfully');
    } on ServerExpcptions catch (e) {
      print('CSRF fetch failed: ${e.error}');
      emit(AdminLoginError('CSRF fetch failed: ${e.error}'));
    }
  }
}
