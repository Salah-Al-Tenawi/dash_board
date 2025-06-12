import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/features/trip_create/data/model/trip_model.dart';

class TripCreateRemoteDataSource {
  final ApiConSumer api;

  TripCreateRemoteDataSource({required this.api});

  Future<TripModel> createTrip(
    String source,
    String destination,
    String date,
    int seats,
    String price,
  ) async {
    final respone = await api.post(ApiEndPoint.rides, data: {
      ApiKey.pickupAddress: source,
      ApiKey.destinationAddress: destination,
      ApiKey.departureTime: date,
      ApiKey.availableSeats: seats,
      ApiKey.pricePerSeat: price,
    });
    return TripModel.fromjson(respone);
  }
}
