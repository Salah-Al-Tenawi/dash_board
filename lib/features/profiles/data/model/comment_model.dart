import 'package:sharecars/core/api/api_end_points.dart';

class CommentModel {
  final int id;
  final String comment;
  final Commenter commenter;
  final String createdAt;

  CommentModel({
    required this.id,
    required this.comment,
    required this.commenter,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json[ApiKey.id] ?? 0,
      comment: json[ApiKey.comment] ?? '',
      commenter: Commenter.fromJson(json[ApiKey.commenter] ?? {}),
      createdAt: json[ApiKey.createdAt] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.comment: comment,
      ApiKey.commenter: commenter.toJson(),
      ApiKey.createdAt: createdAt,
    };
  }
}

class Commenter {
  final int id;
  final String name;
  final String? profilePhoto;

  Commenter({
    required this.id,
    required this.name,
    this.profilePhoto,
  });

  factory Commenter.fromJson(Map<String, dynamic> json) {
    return Commenter(
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      profilePhoto: json[ApiKey.profilePhoto],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.profilePhoto: profilePhoto,
    };
  }
}