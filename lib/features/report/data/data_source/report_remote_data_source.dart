// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/core/utils/functions/get_token.dart';
import 'package:sharecars/features/report/data/model/report_response.dart';

abstract class ReportRemoteDataSource {
  final DioConSumer api;
  const ReportRemoteDataSource({
    required this.api,
  });

  Future<ReportResponse> getreport();
}

class ReportRemoteDataSourceIM extends ReportRemoteDataSource {
  ReportRemoteDataSourceIM({required super.api});
  @override
  
  Future<ReportResponse> getreport() async {
    print("""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""");
   
    final response = await api.get(
      ApiEndPoint.report,
      // header: {ApiKey.authorization: "Bearer ${mytoken()}"}
    );
    print("""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""");
    print(response);
    return ReportResponse.fromJson(response);
  }
}
