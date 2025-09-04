import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/wallet/data/model/wallet_charge_response.dart';
import 'package:sharecars/features/wallet/data/model/wallet_list_response.dart';


import 'package:sharecars/features/wallet/data/model/wallet_transactions_model.dart';
abstract class WalletRepo {
Future<Either<Filuar, WalletTransactionsModel>> getwalletTransactions(String walletid); 
 Future<Either<Filuar, WalletListResponse>> getAllWallets(); 
 Future<Either<Filuar, WalletChargeResponse>> chargeWallet(String amount,String phonenumber); 

}
