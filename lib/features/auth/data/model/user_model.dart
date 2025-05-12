// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sharecars/core/api/api_end_points.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String address;
  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.address,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json[ApiKey.firstName],
        lastName: json[ApiKey.lastName],
        email: json[ApiKey.email],
        gender: json[ApiKey.gender],
        address: json[ApiKey.address]);
  }
}
