import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/excptions.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';
import 'package:sharecars/features/trip_search/data/data%20source/search_remote_data_source.dart';

class SearchRepoIm {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoIm({required this.searchRemoteDataSource});

  Future<Either<Filuar, List<TripModel>>> search(
      String sourceAddress,
      String destinationAddress,
      String departureDate,
      int seatsRequired) async {
    try {
      final response = await searchRemoteDataSource.search(
          sourceAddress, destinationAddress, departureDate, seatsRequired);
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.error);
    }
  }
}
