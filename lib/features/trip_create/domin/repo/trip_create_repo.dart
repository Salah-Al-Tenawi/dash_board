import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';

abstract class TripCreateRepo {
  Future<Either<Filuar, TripModel>> createTrip(
    String source,
    String destination,
    String date,
    int seats,
    String price,
  );
}
// {
//     "pickup_address": "Al-Zabadani, Rif Dimashq, Syria",
//     "destination_address": "Damascus, Syria",
//     "departure_time": "2026-03-20T08:00:00Z",
//     "available_seats": 3,
//     "price_per_seat": 15.50,
//     "vehicle_type": "Sedan"
// }
