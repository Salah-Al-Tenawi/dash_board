// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/core/utils/functions/get_token.dart';

import 'package:sharecars/features/wallet/data/model/wallet_charge_response.dart';
import 'package:sharecars/features/wallet/data/model/wallet_list_response.dart';

import 'package:sharecars/features/wallet/data/model/wallet_transactions_model.dart';

abstract class WalletRemoteDataSource {
  final DioConSumer api;
  const WalletRemoteDataSource({
    required this.api,
  });

  Future<WalletTransactionsModel> getwallettransactions(String walletid);
  Future<WalletListResponse> getallwallet();
  Future<WalletChargeResponse> chargewallet(String amount, String phonenumber);
}

class WalletRemoteDataSourceIM extends WalletRemoteDataSource {
  WalletRemoteDataSourceIM({required super.api});
  @override
  Future<WalletTransactionsModel> getwallettransactions(String walletid) async {
    // Fixed: Return MessageListResponse
    print("reapon...........");
    final response = await api.get(
        "${ApiEndPoint.getWalletTransactions}/$walletid/transactions",
        headers: {ApiKey.authorization: "Bearer ${mytoken()}"});
    print("=========================================");
    return WalletTransactionsModel.fromJson(response);
  }

  @override
  Future<WalletListResponse> getallwallet() async {
    final response = await api.get(ApiEndPoint.getAllWallets,
        );
    print(response);
    return WalletListResponse.fromJson(response);
  }

  @override
  Future<WalletChargeResponse> chargewallet(
      String amount, String phonenumber) async {
    final response = await api.post(
      "${ApiEndPoint.chargeWallet}/charge",
      data: {ApiKey.amount: amount, ApiKey.phoneNumber: phonenumber},
      // header: {ApiKey.authorization: "Bearer ${mytoken()}"}
    );
    final responses = WalletChargeResponse.fromJson(response);
    return responses;
  }
}
