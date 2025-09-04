import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/report/data/data_source/report_remote_data_source.dart';
import 'package:sharecars/features/report/data/model/report_response.dart';


import 'package:sharecars/features/report/domain/repo/auth_repo.dart';

class ReportRepoIm extends ReportRepo {
  final ReportRemoteDataSource reportRemoteDataSource;
  
 ReportRepoIm({
    required this.reportRemoteDataSource,
  });

  @override
  Future<Either<Filuar, ReportResponse>> getreport() async {
    try {
      
  
      final report = await reportRemoteDataSource.getreport();
      
      return right(report);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    }
  }
  

}
