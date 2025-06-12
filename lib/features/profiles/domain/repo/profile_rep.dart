import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/profiles/domain/entity/comment_entity.dart';
import 'package:sharecars/features/profiles/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Filuar, ProfileEntity>> showProfile(int userid);
  //TOdo complate the paramaters
  Future<Either<Filuar, ProfileEntity>> updateProfile(
      File profilePic, String description);
  Future<Either<Filuar, CommentEntity>> addComment(String message);
  Future<Either<Filuar, String>> verifypassenger(
      File faceIdPic, File backIdPic);
  Future<Either<Filuar, String>> verifydriver(
      File faceIdPic, File backIdPic, File licensePic, mechanicPic);
  Future<Either<Filuar, String>> rateUser(int userid, double rate);
}
