import 'package:sharecars/core/api/api_end_points.dart';
import 'ride_stats.dart';
import 'financial_stats.dart';
import 'date_range.dart';

class ReportResponse {
  final String status;
  final ReportData reportData;

  ReportResponse({
    required this.status,
    required this.reportData,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
      status: json[ApiKey.status],
      reportData: ReportData.fromJson(json[ApiKey.reportData]),
    );
  }
}

class ReportData {
  final RideStats rideStats;
  final FinancialStats financialStats;
  final DateRange dateRange;

  ReportData({
    required this.rideStats,
    required this.financialStats,
    required this.dateRange,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      rideStats: RideStats.fromJson(json[ApiKey.rideStats]),
      financialStats: FinancialStats.fromJson(json[ApiKey.financialStats]),
      dateRange: DateRange.fromJson(json[ApiKey.dateRange]),
    );
  }
}
