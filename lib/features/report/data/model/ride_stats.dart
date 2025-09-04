import 'package:sharecars/core/api/api_end_points.dart';

class RideStats {
  final int total;
  final int canceled;
  final int active;
  final int awaitingConfirmation;
  final int completed;

  RideStats({
    required this.total,
    required this.canceled,
    required this.active,
    required this.awaitingConfirmation,
    required this.completed,
  });

  factory RideStats.fromJson(Map<String, dynamic> json) {
    return RideStats(
      total: json[ApiKey.totalRides],
      canceled: json[ApiKey.canceled],
      active: json[ApiKey.active],
      awaitingConfirmation: json[ApiKey.awaitingConfirmation],
      completed: json[ApiKey.completed],
    );
  }
}
