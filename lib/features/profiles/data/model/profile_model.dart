import 'package:sharecars/features/profiles/data/model/comment_model.dart';

class ProfileModel {
  late final int userid;
  late final String name;
  late final String imageUrl;
  late final String address;
  late final String hintline;
  late final String reviewsCount;
  late final String tripsCount;
  late final String? carColor;
  late final String? carName;
  late final String? carImage;
  late final String? carSeats;
  List<CommentModel>? comments;
}
