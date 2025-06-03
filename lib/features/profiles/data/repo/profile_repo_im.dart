import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/profiles/data/model/profile_model.dart';
import 'package:sharecars/features/profiles/domain/repo/profile_rep.dart';

class ProfileRepoIm extends ProfileRepo {
  @override
  Future<Either<Filuar, ProfileModel>> addcommit(String message) {
    // TODO: implement addcommit
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, ProfileModel>> showProfile(int userid) {
    // TODO: implement showProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, ProfileModel>> showMyProfile() {
    // TODO: implement showProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Filuar, ProfileModel>> updateProfile(int userid) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
