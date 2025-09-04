import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/report/data/model/report_response.dart';

import 'package:sharecars/features/report/domain/repo/auth_repo.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepo reportRepo;

  ReportCubit(this.reportRepo) : super(ReportInitial());

  Future<void> getreport() async {
    emit(ReportLoading());
    final Either<Filuar, ReportResponse> response =
        await reportRepo.getreport();
    response.fold(
      (error) => emit(ReportError(message: error.message)),
      
      (result) => emit(ReportSuccess(reportResponse: result)),
      
    );
  }
}
