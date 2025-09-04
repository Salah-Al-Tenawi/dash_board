import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/wallet/data/model/wallet_transactions_model.dart';
import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';

part 'wallet_transactions_state.dart';

class WalletTransactionsCubit extends Cubit<WalletState> {
  final WalletRepo walletRepo;
  StreamSubscription<WalletTransactionsModel>? _walletStreamSub;

  WalletTransactionsCubit(this.walletRepo) : super(WalletInitial());

  Future<void> getWalletTransactions(String walletId) async {
    emit(WalletLoading());
    final Either<Filuar, WalletTransactionsModel> response =
        await walletRepo.getwalletTransactions(walletId);

    response.fold(
      (error) => emit(WalletError(message: error.message)),
      (result) => emit(WalletTransactionsLoaded(walletTransactions: result)),
    );
  }
  

  @override
  Future<void> close() {
    _walletStreamSub?.cancel();
    return super.close();
  }
}
