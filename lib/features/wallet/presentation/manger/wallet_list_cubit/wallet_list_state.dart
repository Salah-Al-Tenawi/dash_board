part of 'wallet_list_cubit.dart';

abstract class WalletListState {}

class WalletListInitial extends WalletListState {}

class WalletListLoading extends WalletListState {}

class WalletListLoaded extends WalletListState {
  final WalletListResponse walletList;
  WalletListLoaded({required this.walletList});
}

class WalletListError extends WalletListState {
  final String message;
  WalletListError({required this.message});
}
