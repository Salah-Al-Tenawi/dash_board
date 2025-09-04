import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';

import 'package:sharecars/features/report/data/model/report_response.dart';
abstract class ReportRepo {
 Future<Either<Filuar, ReportResponse>> getreport(); 

 
}
