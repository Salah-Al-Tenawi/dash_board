import 'package:image_picker/image_picker.dart';
import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/utils/functions/get_token.dart';
import 'package:sharecars/features/profiles/data/model/comment_model.dart';
import 'package:sharecars/features/profiles/data/model/profile_model.dart';
import 'package:sharecars/features/profiles/data/model/rating_modle.dart';

abstract class ProfileRemoteDateSource {
  final ApiConSumer api;

  ProfileRemoteDateSource({required this.api});
  Future<ProfileModel> showProfile(int id);
  Future<ProfileModel> updateProfile(
      XFile? profilePhoto,
      String? description,
      String? colorOfCar,
      int? numberOfSeats,
      XFile? carPic,
      int? radio,
      int? smoking,
      XFile? faceIdPic,
      XFile? backIdPic,
      XFile? drivingLicPic,
      XFile? mechanieCardPic,
      String? typeOfCar,
      String? gender,
      String? address);

  Future<CommentModel> addcommit(String commit, int userid);
  Future<RatingModle> rateUser(double rating, int userId);
}

class ProfileRemoteDateSourceIm extends ProfileRemoteDateSource {
  ProfileRemoteDateSourceIm({required super.api});

  @override
  Future<ProfileModel> showProfile(int id) async {
    final response = await api.get("${ApiEndPoint.profile}/$id");

    return ProfileModel.fromJson(response);
  }

  @override
  Future<CommentModel> addcommit(String commit, int userId) async {
    final response = await api.post("${ApiEndPoint.profile}/$userId/comments",
        header: {ApiKey.authorization: mytoken()},
        data: {ApiKey.comment: commit});

    return CommentModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile(
      XFile? profilePhoto,
      String? description,
      String? colorOfCar,
      int? numberOfSeats,
      XFile? carPic,
      int? radio,
      int? smoking,
      XFile? faceIdPic,
      XFile? backIdPic,
      XFile? drivingLicPic,
      XFile? mechanieCardPic,
      String? typeOfCar,
      String? gender,
      String? address) async {
    final response = await api.post(ApiEndPoint.profile, header: {
      ApiKey.authorization: mytoken()
    }, data: {
      ApiKey.profilePhoto: profilePhoto,
      ApiKey.description: description,
      ApiKey.colorOfCar: colorOfCar,
      ApiKey.numberOfSeats: numberOfSeats,
      ApiKey.carPic: carPic,
      ApiKey.radio: radio,
      ApiKey.smoking: smoking,
      ApiKey.faceIdPic: faceIdPic,
      ApiKey.backIdPic: backIdPic,
      ApiKey.drivingLicensePic: drivingLicPic,
      ApiKey.mechanicCardPic: mechanieCardPic,
      ApiKey.typeOfCar: typeOfCar,
      ApiKey.gender: gender,
      ApiKey.address: address
    });
    return ProfileModel.fromJson(response);
  }

  @override
  Future<RatingModle> rateUser(double rating, int userId) async {
    final response = await api.post("${ApiEndPoint.profile}/$userId/rate",
        header: {ApiKey.authorization: mytoken()},
        data: {ApiKey.rating: rating});

    return RatingModle.fromJson(response);
  }
}
