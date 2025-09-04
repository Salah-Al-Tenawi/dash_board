import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/wallet/data/model/wallet_list_response.dart';

import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';

part 'wallet_list_state.dart';

class WalletListCubit extends Cubit<WalletListState> {
  final WalletRepo walletRepo;

  WalletListCubit(this.walletRepo) : super(WalletListInitial());

  Future<void> getAllWallets() async {
    emit(WalletListLoading());
    final response =
        await walletRepo.getAllWallets();

    response.fold(
      (error) => emit(WalletListError(message: error.message)),
      (result) => emit(WalletListLoaded(walletList: result)),
    );
  }
}

 