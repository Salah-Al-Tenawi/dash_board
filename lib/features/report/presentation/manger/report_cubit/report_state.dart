part of 'report_cubit.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object?> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportSuccess extends ReportState {
  final ReportResponse reportResponse;
  const ReportSuccess({required this.reportResponse});

  @override
  List<Object?> get props => [reportResponse];
}

class ReportError extends ReportState {
  final String message;

  const ReportError({required this.message});

  @override
  List<Object?> get props => [message];

}
