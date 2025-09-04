part of 'wallet_charge_cubit.dart';

@immutable
abstract class WalletChargeState {}

class WalletChargeInitial extends WalletChargeState {}

class WalletChargeLoading extends WalletChargeState {}

class WalletChargeLoaded extends WalletChargeState {
  final WalletChargeResponse walletChargeResponse;

  WalletChargeLoaded({required this.walletChargeResponse});
}

class WalletChargeError extends WalletChargeState {
  final String message;

  WalletChargeError({required this.message});
}
