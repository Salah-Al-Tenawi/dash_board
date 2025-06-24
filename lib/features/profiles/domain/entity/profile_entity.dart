import 'package:sharecars/features/profiles/data/model/documents_model.dart';
import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/domain/entity/comment_entity.dart';

class ProfileEntity {
  final String fullname;
  final String? profilePhoto;
  final int numberOfides;
  final int totalRating;
  final double averageRating;
  final String verification;
  late final String description;
  final String address;
  final String gender;
  final CarEntity? car;
  final List<CommentEntity>? comments;
  final DocumentsModel? documents;

  ProfileEntity({
    required this.fullname,
    required this.profilePhoto,
    required this.numberOfides,
    required this.totalRating,
    required this.averageRating,
    required this.verification,
    required this.description,
    required this.address,
    required this.gender,
    required this.car,
    required this.comments,
    required this.documents,
  });

  ProfileEntity copyWith({
    String? fullname,
    String? profilePhoto,
    int? numberOfides,
    int? totalRating,
    double? averageRating,
    String? verification,
    String? description,
    String? address,
    String? gender,
    CarEntity? car,
    List<CommentEntity>? comments,
    DocumentsModel? documents,
  }) {
    return ProfileEntity(
      fullname: fullname ?? this.fullname,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      numberOfides: numberOfides ?? this.numberOfides,
      totalRating: totalRating ?? this.totalRating,
      averageRating: averageRating ?? this.averageRating,
      verification: verification ?? this.verification,
      description: description ?? this.description,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      car: car ?? this.car,
      comments: comments ?? this.comments,
      documents: documents ?? this.documents,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileEntity &&
          runtimeType == other.runtimeType &&
          fullname == other.fullname &&
          profilePhoto == other.profilePhoto &&
          numberOfides == other.numberOfides &&
          totalRating == other.totalRating &&
          averageRating == other.averageRating &&
          verification == other.verification &&
          description == other.description &&
          address == other.address &&
          gender == other.gender &&
          car == other.car &&
          comments == other.comments &&
          documents == other.documents;

  @override
  int get hashCode =>
      fullname.hashCode ^
      profilePhoto.hashCode ^
      numberOfides.hashCode ^
      totalRating.hashCode ^
      averageRating.hashCode ^
      verification.hashCode ^
      description.hashCode ^
      address.hashCode ^
      gender.hashCode ^
      car.hashCode ^
      comments.hashCode ^
      documents.hashCode;
}