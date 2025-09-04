part of 'sycach_cubit.dart';



sealed class SycashLoginState extends Equatable {
  const SycashLoginState();

  @override
  List<Object> get props => [];
}

final class SycashLoginInitial extends SycashLoginState {}
final class SycashLoginLoading extends SycashLoginState {}
final class SycashLoginSuccess extends SycashLoginState {}
final class SycashLoginError extends SycashLoginState {
  final String message;
  const SycashLoginError(this.message);
}
