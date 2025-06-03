import 'package:sharecars/features/profiles/domain/entity/car_entity.dart';
import 'package:sharecars/features/profiles/domain/entity/comment_entity.dart';
import 'package:sharecars/features/profiles/domain/entity/documents_entity.dart';

class ProfileEntity {
  final String fullname;
  final String? profilePhoto;
  final int numberOfides;
  final double rate;
  final int numberRating;
  final String verification;
  final String description;
  final String address;
  final String gender;
  CarEntity? car;
  List<CommentEntity>? comments;
  DocumentsEntity documents;

  ProfileEntity({
    required this.fullname,
    required this.profilePhoto,
    required this.rate,
    required this.verification,
    required this.address,
    required this.gender,
    required this.description,
    required this.car,
    required this.comments,
    required this.documents,
    required this.numberRating,
    required this.numberOfides,
  });
}
