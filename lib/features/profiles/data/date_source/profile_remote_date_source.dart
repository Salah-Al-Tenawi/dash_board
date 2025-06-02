import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/features/profiles/data/model/car_model.dart';
import 'package:sharecars/features/profiles/data/model/profile_model.dart';

abstract class ProfileRemoteDateSource {
  final ApiConSumer api;

  ProfileRemoteDateSource({required this.api});
  Future<ProfileModel> showProfile(int id);
  Future<ProfileModel> updateProfile(
      String name, int imageId, String address, CarModel car);
  checkUpProfile();
  Future<ProfileModel> addcommit(String commit);
} 
class ProfileRemoteDateSourceIm extends ProfileRemoteDateSource{
  ProfileRemoteDateSourceIm({required super.api});

  @override
  checkUpProfile() {
    // TODO: implement checkUpProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> showProfile(int id) {
    // TODO: implement showProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> updateProfile(String name, int imageId, String address, CarModel car) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  
  @override
  Future<ProfileModel> addcommit(String commit) {
    // TODO: implement addcommit
    throw UnimplementedError();
  } 

}
