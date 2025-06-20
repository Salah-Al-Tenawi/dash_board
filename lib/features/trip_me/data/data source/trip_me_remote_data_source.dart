import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';

import 'package:sharecars/core/utils/functions/get_token.dart';

class TripMeRemoteDataSource {
  final ApiConSumer api;

  TripMeRemoteDataSource({required this.api});

// todo return type
  Future<dynamic> getMyTrip() async {
    final response = await api
        .get(ApiEndPoint.rides, header: {ApiKey.authorization: mytoken()});
    return response;
  }

// todo return type
  Future<dynamic> showOneTrip(int tripId) async {
    final response = await api.post("${ApiEndPoint.rides}/$tripId",
        header: {ApiKey.authorization: mytoken()});

    return response;
  }

  Future<dynamic> cancelTrip(int tripId) async {
    final response = await api.patch("${ApiEndPoint.rides}/$tripId/cancel",
        header: {ApiKey.authorization: mytoken()});
    return response;
  }
}
