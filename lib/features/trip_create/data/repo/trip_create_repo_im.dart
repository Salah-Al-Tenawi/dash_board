import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/trip_create/data/data_source/trip_create_remote_data_source.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';
import 'package:sharecars/features/trip_create/domin/repo/trip_create_repo.dart';

class TripCreateRepoIm extends TripCreateRepo {
  final TripCreateRemoteDataSource tripCreateRemoteDataSource;

  TripCreateRepoIm({required this.tripCreateRemoteDataSource});
  @override
  Future<Either<Filuar, TripModel>> createTrip(String source,
      String destination, String date, int seats, String price) async {
    try {
      final response = await tripCreateRemoteDataSource.createTrip(
          source, destination, date, seats, price);
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    }
  }
}
