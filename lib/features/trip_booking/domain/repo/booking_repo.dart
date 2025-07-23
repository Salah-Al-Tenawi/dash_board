import 'package:dartz/dartz.dart';
import 'package:sharecars/core/errors/filuar.dart';
import 'package:sharecars/features/trip_booking/data/model/booking_model.dart';

abstract class BookingRepo {
  Future<Either<Filuar, BookingModel>> booking(int seats , int tripId);
}
