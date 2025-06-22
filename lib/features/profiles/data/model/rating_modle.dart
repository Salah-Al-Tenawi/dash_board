import 'package:sharecars/core/api/api_end_points.dart';

class RatingModle {
  final String message;
  final int totalRating;
  final double averageRating;

  RatingModle(
      {required this.message,
      required this.totalRating,
      required this.averageRating});
  factory RatingModle.fromJson(Map<String, dynamic> json) {
    return RatingModle(
        message: json[ApiKey.message] ?? "",
        totalRating: json[ApiKey.data][ApiKey.totalRatings] ?? 0,
        averageRating: json[ApiKey.data][ApiKey.averageRating] ?? 0);
  }
}
