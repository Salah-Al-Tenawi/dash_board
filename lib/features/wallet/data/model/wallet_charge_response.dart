

import 'package:sharecars/core/api/api_end_points.dart';

class WalletChargeResponse {
  final String status;
  final String message;
  final String transactionId;
  final String chargedBy;
  final WalletCharge wallet;

  WalletChargeResponse({
    required this.status,
    required this.message,
    required this.transactionId,
    required this.chargedBy,
    required this.wallet,
  });

  factory WalletChargeResponse.fromJson(Map<String, dynamic> json) =>
      WalletChargeResponse(
        status: json[ApiKey.status],
        message: json[ApiKey.message],
        transactionId: json[ApiKey.transactionId],
        chargedBy: json[ApiKey.chargedBy],
        wallet: WalletCharge.fromJson(json[ApiKey.wallet]),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.status: status,
        ApiKey.message: message,
        ApiKey.transactionId: transactionId,
        ApiKey.chargedBy: chargedBy,
        ApiKey.wallet: wallet.toJson(),
      };
}

class WalletCharge {
  final int id;
  final String phoneNumber;
  final String previousBalance;
  final dynamic newBalance;
  final String owner;

  WalletCharge({
    required this.id,
    required this.phoneNumber,
    required this.previousBalance,
    required this.newBalance,
    required this.owner,
  });

  factory WalletCharge.fromJson(Map<String, dynamic> json) => WalletCharge(
        id: json[ApiKey.id],
        phoneNumber: json[ApiKey.phoneNumber],
        previousBalance: json[ApiKey.previousBalance],
        newBalance: json[ApiKey.newBalance],
        owner: json[ApiKey.owner],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.previousBalance: previousBalance,
        ApiKey.newBalance: newBalance,
        ApiKey.owner: owner,
      };
}
