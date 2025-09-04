import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/wallet/data/data_source/wallet_remote_data_source.dart';
import 'package:sharecars/features/wallet/data/model/wallet_charge_response.dart';
import 'package:sharecars/features/wallet/data/model/wallet_list_response.dart';
import 'package:sharecars/features/wallet/data/model/wallet_transactions_model.dart';
import 'package:sharecars/features/wallet/domain/repo/wallet_repo.dart';

class WalletRepoIm extends WalletRepo {
  final WalletRemoteDataSource walletRemoteDataSource;

  WalletRepoIm({
    required this.walletRemoteDataSource,
  });

  @override
  Future<Either<Filuar, WalletTransactionsModel>> getwalletTransactions(
      String walletid) async {
    try {
      final result =
          await walletRemoteDataSource.getwallettransactions(walletid);
      return right(result);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    } catch (e) {
      return left(Filuar(message: 'Unexpected error: $e'));
    }
  }
    @override
  Future<Either<Filuar,WalletListResponse>>getAllWallets() async {
    try {
      final result =
          await walletRemoteDataSource.getallwallet();
      return right(result);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    } catch (e) {
      return left(Filuar(message: 'Unexpected error: $e'));
    }
  }

      @override
  Future<Either<Filuar, WalletChargeResponse>>chargeWallet(String amount,String phonenumber) async {
    try {
      final result =
          await walletRemoteDataSource.chargewallet(amount,phonenumber);
      return right(result);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    } catch (e) {
      return left(Filuar(message: 'Unexpected error: $e'));
    }
  }
}

