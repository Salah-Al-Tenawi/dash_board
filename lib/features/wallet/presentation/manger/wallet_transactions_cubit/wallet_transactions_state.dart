part of 'wallet_transactions_cubit.dart';

abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletTransactionsLoaded extends WalletState {
  final WalletTransactionsModel walletTransactions;
  WalletTransactionsLoaded({required this.walletTransactions});
}

class WalletError extends WalletState {
  final String message;
  WalletError({required this.message});
}
