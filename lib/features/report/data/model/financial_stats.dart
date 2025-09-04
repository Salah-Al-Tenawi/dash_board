import 'package:sharecars/core/api/api_end_points.dart';

class FinancialStats {
  final SyCash sycash;
  final AdminWallet adminWallet;
  final int activeRidesAmount;
  final DebugInfo debugInfo;

  FinancialStats({
    required this.sycash,
    required this.adminWallet,
    required this.activeRidesAmount,
    required this.debugInfo,
  });

  factory FinancialStats.fromJson(Map<String, dynamic> json) {
    return FinancialStats(
      sycash: SyCash.fromJson(json[ApiKey.sycash]),
      adminWallet: AdminWallet.fromJson(json[ApiKey.adminWallet]),
      activeRidesAmount: json[ApiKey.activeRidesAmount],
      debugInfo: DebugInfo.fromJson(json[ApiKey.debugInfo]),
    );
  }
}

class SyCash {
  final int currentBalance;
  final int totalRideCreationFees;

  SyCash({
    required this.currentBalance,
    required this.totalRideCreationFees,
  });

  factory SyCash.fromJson(Map<String, dynamic> json) {
    return SyCash(
      currentBalance: json[ApiKey.currentBalanceSy],
      totalRideCreationFees: json[ApiKey.totalRideCreationFees],
    );
  }
}

class AdminWallet {
  final int currentBalance;
  final int totalBookingCollected;
  final int totalBookingTransferred;

  AdminWallet({
    required this.currentBalance,
    required this.totalBookingCollected,
    required this.totalBookingTransferred,
  });

  factory AdminWallet.fromJson(Map<String, dynamic> json) {
    return AdminWallet(
      currentBalance: json[ApiKey.currentBalanceAdmin],
      totalBookingCollected: json[ApiKey.totalBookingCollected],
      totalBookingTransferred: json[ApiKey.totalBookingTransferred],
    );
  }
}

class DebugInfo {
  final TransferCalculationMethods transferCalculationMethods;
  final AdminTransactionTypes adminTransactionTypes;

  DebugInfo({
    required this.transferCalculationMethods,
    required this.adminTransactionTypes,
  });

  factory DebugInfo.fromJson(Map<String, dynamic> json) {
    return DebugInfo(
      transferCalculationMethods:
          TransferCalculationMethods.fromJson(json[ApiKey.transferCalculationMethods]),
      adminTransactionTypes:
          AdminTransactionTypes.fromJson(json[ApiKey.adminTransactionTypes]),
    );
  }
}

class TransferCalculationMethods {
  final int byTransactionType;
  final int byDescription;
  final int finalUsed;

  TransferCalculationMethods({
    required this.byTransactionType,
    required this.byDescription,
    required this.finalUsed,
  });

  factory TransferCalculationMethods.fromJson(Map<String, dynamic> json) {
    return TransferCalculationMethods(
      byTransactionType: json[ApiKey.byTransactionType],
      byDescription: json[ApiKey.byDescription],
      finalUsed: json[ApiKey.finalUsed],
    );
  }
}

class AdminTransactionTypes {
  final AdminCredit adminCredit;

  AdminTransactionTypes({required this.adminCredit});

  factory AdminTransactionTypes.fromJson(Map<String, dynamic> json) {
    return AdminTransactionTypes(
      adminCredit: AdminCredit.fromJson(json[ApiKey.adminCredit]),
    );
  }
}

class AdminCredit {
  final int count;
  final int totalAmount;

  AdminCredit({
    required this.count,
    required this.totalAmount,
  });

  factory AdminCredit.fromJson(Map<String, dynamic> json) {
    return AdminCredit(
      count: json[ApiKey.count],
      totalAmount: json[ApiKey.totalAmount],
    );
  }
}
