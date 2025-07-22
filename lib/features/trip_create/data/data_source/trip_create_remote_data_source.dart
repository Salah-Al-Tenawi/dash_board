import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';

class TripCreateRemoteDataSource {
  final ApiConSumer api;

  TripCreateRemoteDataSource({required this.api});

  Future<TripModel> createTrip(
    String startLat,
    String statrtLng,
    String endLat,
    String endLng,
    String date,
    int seats,
    String price,
    String? notes,
    int routeIndex,
    String paymentMethod,
    String bookingType ,
  ) async {
    final respone = await api.post(ApiEndPoint.createRide, data: {
      ApiKey.pickuplat: startLat,
      ApiKey.pickuplng: statrtLng,
      ApiKey.destinationlat: endLat,
      ApiKey.destinationlng: endLng,
      ApiKey.departureTime: date,
      ApiKey.availableSeats: seats,
      ApiKey.pricePerSeat: price,
      ApiKey.notes: notes,
      ApiKey.routeIndex: routeIndex,
      ApiKey.paymentmethod: paymentMethod, 
      ApiKey.bookingType :bookingType

    });
    return TripModel.fromjson(respone);
  }
}
