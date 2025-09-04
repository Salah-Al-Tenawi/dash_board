import 'package:sharecars/core/api/api_end_points.dart';

class WalletTransactionsModel {
  final String status;
  final Wallet wallet;
  final Transactions transactions;

  WalletTransactionsModel({
    required this.status,
    required this.wallet,
    required this.transactions,
  });

  factory WalletTransactionsModel.fromJson(Map<String, dynamic> json) =>
      WalletTransactionsModel(
        status: json[ApiKey.status],
        wallet: Wallet.fromJson(json[ApiKey.wallet]),
        transactions: Transactions.fromJson(json[ApiKey.data]),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.status: status,
        ApiKey.wallet: wallet.toJson(),
        ApiKey.data: transactions.toJson(),
      };
}

class Wallet {
  final int id;
  final int userId;
  final String walletNumber;
  final String balance;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Wallet({
    required this.id,
    required this.userId,
    required this.walletNumber,
    required this.balance,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json[ApiKey.id],
        userId: json[ApiKey.userId],
        walletNumber: json[ApiKey.walletNumber],
        balance: json[ApiKey.balance],
        phoneNumber: json[ApiKey.phoneNumber],
        createdAt: DateTime.parse(json[ApiKey.createdAt]),
        updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.userId: userId,
        ApiKey.walletNumber: walletNumber,
        ApiKey.balance: balance,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.createdAt: createdAt.toIso8601String(),
        ApiKey.updatedAt: updatedAt.toIso8601String(),
      };
}

class Transactions {
  final int currentPage;
  final List<Transaction> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  Transactions({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        currentPage: json[ApiKey.currentPage],
        data: List<Transaction>.from(
            (json[ApiKey.data] as List).map((x) => Transaction.fromJson(x))),
        firstPageUrl: json[ApiKey.firstPageUrl],
        from: json[ApiKey.from],
        lastPage: json[ApiKey.lastPage],
        lastPageUrl: json[ApiKey.lastPageUrl],
        links: List<Link>.from(
            (json[ApiKey.links] as List).map((x) => Link.fromJson(x))),
        nextPageUrl: json[ApiKey.nextPageUrl],
        path: json[ApiKey.path],
        perPage: json[ApiKey.perPage],
        prevPageUrl: json[ApiKey.prevPageUrl],
        to: json[ApiKey.to],
        total: json[ApiKey.total],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.currentPage: currentPage,
        ApiKey.data: data.map((x) => x.toJson()).toList(),
        ApiKey.firstPageUrl: firstPageUrl,
        ApiKey.from: from,
        ApiKey.lastPage: lastPage,
        ApiKey.lastPageUrl: lastPageUrl,
        ApiKey.links: links.map((x) => x.toJson()).toList(),
        ApiKey.nextPageUrl: nextPageUrl,
        ApiKey.path: path,
        ApiKey.perPage: perPage,
        ApiKey.prevPageUrl: prevPageUrl,
        ApiKey.to: to,
        ApiKey.total: total,
      };
}

class Transaction {
  final int id;
  final int walletId;
  final int userId;
  final String type;
  final String amount;
  final String previousBalance;
  final String newBalance;
  final String description;
  final String transactionId;
  final String status;
  final String? reference;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.walletId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.previousBalance,
    required this.newBalance,
    required this.description,
    required this.transactionId,
    required this.status,
    this.reference,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json[ApiKey.id],
        walletId: json[ApiKey.walletId],
        userId: json[ApiKey.userId],
        type: json[ApiKey.type],
        amount: json[ApiKey.amount],
        previousBalance: json[ApiKey.previousBalanceT],
        newBalance: json[ApiKey.newBalanceT],
        description: json[ApiKey.description],
        transactionId: json[ApiKey.transactionId],
        status: json[ApiKey.statusT],
        reference: json[ApiKey.reference],
        createdAt: DateTime.parse(json[ApiKey.createdAt]),
        updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.walletId: walletId,
        ApiKey.userId: userId,
        ApiKey.type: type,
        ApiKey.amount: amount,
        ApiKey.previousBalanceT: previousBalance,
        ApiKey.newBalanceT: newBalance,
        ApiKey.description: description,
        ApiKey.transactionId: transactionId,
        ApiKey.statusT: status,
        ApiKey.reference: reference,
        ApiKey.createdAt: createdAt.toIso8601String(),
        ApiKey.updatedAt: updatedAt.toIso8601String(),
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
