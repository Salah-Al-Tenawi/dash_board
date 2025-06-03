import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/features/profiles/data/model/car_model.dart';
import 'package:sharecars/features/profiles/data/model/comment_model.dart';
import 'package:sharecars/features/profiles/data/model/documents_model.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  final bool success;
  final ProfileData data;

  ProfileModel({
    required this.success,
    required this.data,
  }) : super(fullname: data.fullName, profilePhoto: data.profilePhoto, rate: data.rate, verification: data.verificationStatus, address: data.address, gender: data.gender, description: data.description, car: data.car, comments: data.comments, documents: data.documents, numberRating: data.numberRating, numberOfides: data.numberOfRides);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json[ApiKey.success] ?? false,
      data: ProfileData.fromJson(json[ApiKey.data] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.success: success,
      ApiKey.data: data.toJson(),
    };
  }
}

class ProfileData {
  final int userId;
  final String fullName;
  final String verificationStatus;
  final String address;
  final String gender;
  final String? profilePhoto;
  final String description;
  final double rate;
  final int numberRating;
   final CarModel? car;
  final int numberOfRides; 
  final DocumentsModel? documents;
  final List<CommentModel>? comments;

  ProfileData({
    required this.rate,
    required this.numberRating,
    required this.userId,
    required this.fullName,
    required this.verificationStatus,
    required this.address,
    required this.gender,
    this.profilePhoto,
    required this.description,
     this.car,
    required this.numberOfRides,
    required this.documents,
    required this.comments,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      userId: json[ApiKey.userId] ?? 0,
      fullName: json[ApiKey.fullName] ?? '',
      numberRating: json[ApiKey.numberRating] ?? 0, 
      rate: json[ApiKey.rate] ?? 0, 
      verificationStatus: json[ApiKey.verificationStatus] ?? 'none',
      address: json[ApiKey.address] ?? '',
      gender: json[ApiKey.gender] ?? 'Male',
      profilePhoto: json[ApiKey.profilePhoto],
      description: json[ApiKey.description] ?? '',
      car: json[ApiKey.typeOfCar] != null ? CarModel.fromJson(json) : null,
      numberOfRides: json[ApiKey.numberOfRides] ?? 0,
      documents: json[ApiKey.documents] != null 
          ? DocumentsModel.fromJson(json[ApiKey.documents]) 
          : null,
      comments: (json[ApiKey.comments] as List<dynamic>?)
              ?.map((comment) => CommentModel.fromJson(comment))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.userId: userId,
      ApiKey.fullName: fullName,
      ApiKey.verificationStatus: verificationStatus,
      ApiKey.address: address,
      ApiKey.gender: gender,
      ApiKey.profilePhoto: profilePhoto,
      ApiKey.description: description,
      if (car != null) ...car!.toJson(),
      ApiKey.numberOfRides: numberOfRides,
      ApiKey.documents: documents?.toJson(),
      ApiKey.comments: comments?.map((comment) => comment.toJson()).toList(),
    };
  }
}