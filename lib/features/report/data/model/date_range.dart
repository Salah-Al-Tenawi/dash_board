import 'package:sharecars/core/api/api_end_points.dart';

class DateRange {
  final String? start;
  final String? end;

  DateRange({this.start, this.end});

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      start: json[ApiKey.start],
      end: json[ApiKey.end],
    );
  }
}
