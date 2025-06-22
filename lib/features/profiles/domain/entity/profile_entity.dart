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
  final String description;
  final String address;
  final String gender;
  CarEntity? car;
  List<CommentEntity>? comments;
  DocumentsModel ?documents;

  ProfileEntity({
    required this.fullname,
    required this.profilePhoto,
    required this.totalRating,
    required this.verification,
    required this.address,
    required this.gender,
    required this.description,
    required this.car,
    required this.comments,
    required this.documents,
    required this.averageRating,
    required this.numberOfides,
  });
}
