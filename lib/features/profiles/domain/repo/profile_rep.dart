import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/profiles/data/model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Filuar, ProfileModel>> addcommit(String message);
  Future<Either<Filuar, ProfileModel>> showProfile(int userid);
  Future<Either<Filuar, ProfileModel>> showMyProfile();
  Future<Either<Filuar, ProfileModel>> updateProfile(int userid);
}
