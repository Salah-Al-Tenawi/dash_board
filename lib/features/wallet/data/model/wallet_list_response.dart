import 'package:sharecars/core/api/api_end_points.dart';

class WalletListResponse {
  final String status;
  final Wallets wallets;

  WalletListResponse({
    required this.status,
    required this.wallets,
  });

  factory WalletListResponse.fromJson(Map<String, dynamic> json) =>
      WalletListResponse(
        status: json[ApiKey.status],
        wallets: Wallets.fromJson(json[ApiKey.data] ?? json['wallets']),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.status: status,
        'wallets': wallets.toJson(),
      };
}

class Wallets {
  final int currentPage;
  final List<WalletData> data;
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

  Wallets({
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

  factory Wallets.fromJson(Map<String, dynamic> json) => Wallets(
        currentPage: json[ApiKey.currentPage],
        data: List<WalletData>.from(
            (json[ApiKey.data] as List).map((x) => WalletData.fromJson(x))),
        firstPageUrl: json[ApiKey.firstPageUrl],
        from: json[ApiKey.from],
        lastPage: json[ApiKey.lastPage],
        lastPageUrl: json[ApiKey.lastPageUrl],
        links:
            List<Link>.from((json[ApiKey.links] as List).map((x) => Link.fromJson(x))),
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

class WalletData {
  final int id;
  final int userId;
  final String walletNumber;
  final String balance;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  WalletData({
    required this.id,
    required this.userId,
    required this.walletNumber,
    required this.balance,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
        id: json[ApiKey.id],
        userId: json[ApiKey.userId],
        walletNumber: json['wallet_number'],
        balance: json['balance'],
        phoneNumber: json[ApiKey.phoneNumber],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.userId: userId,
        'wallet_number': walletNumber,
        'balance': balance,
        ApiKey.phoneNumber: phoneNumber,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'user': user.toJson(),
      };
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json[ApiKey.id],
        firstName: json[ApiKey.firstName],
        lastName: json[ApiKey.lastName],
        email: json[ApiKey.email],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.firstName: firstName,
        ApiKey.lastName: lastName,
        ApiKey.email: email,
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
        url: json['url'],
        label: json['label'],
        active: json['active'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };
}
