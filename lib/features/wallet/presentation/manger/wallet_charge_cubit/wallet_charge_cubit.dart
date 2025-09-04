import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/wallet/data/model/wallet_charge_response.dart';
import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';


part 'wallet_charge_state.dart';

class WalletChargeCubit extends Cubit<WalletChargeState> {
  final WalletRepo walletRepo;

  WalletChargeCubit(this.walletRepo) : super(WalletChargeInitial());

  Future<void> chargeWallet(String amount, String phoneNumber) async {
    emit(WalletChargeLoading());
    final Either<Filuar, WalletChargeResponse> response =
        await walletRepo.chargeWallet(amount, phoneNumber);

    response.fold(
      (error) => emit(WalletChargeError(message: error.message)),
      (result) => emit(WalletChargeLoaded(walletChargeResponse: result)),
    );
  }
}
