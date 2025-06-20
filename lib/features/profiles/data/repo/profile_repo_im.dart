import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/profiles/domain/entity/comment_entity.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';
import 'package:sharecars/features/profiles/domain/repo/profile_rep.dart';

class ProfileRepoIm extends ProfileRepo {
  @override
  Future<Either<Filuar, CommentEntity>> addComment(String message) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, String>> rateUser(int userid, double rate) {
    // TODO: implement rateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, ProfileEntity>> showProfile(int userid) {
    // TODO: implement showProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, ProfileEntity>> updateProfile(
      File profilePic, String description) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
