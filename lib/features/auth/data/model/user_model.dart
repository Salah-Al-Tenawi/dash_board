// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sharecars/core/api/api_end_points.dart';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String address;
  final String token;
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.address,
    required this.token
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
        id: json[ApiKey.user][ApiKey.id],
        firstName: json[ApiKey.user][ApiKey.firstName],
        lastName: json[ApiKey.user][ApiKey.lastName],
        email: json[ApiKey.user][ApiKey.email],
        gender: json[ApiKey.user][ApiKey.gender],
        address: json[ApiKey.user][ApiKey.address] ,
        token: json[ApiKey.token]
        );
  }
}
