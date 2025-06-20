import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/utils/functions/get_token.dart';

class SearchRemoteDataSource {

    final ApiConSumer api;

  SearchRemoteDataSource({required this.api}); 



  
 
  Future<dynamic> showOneTrip(int tripId) async {
    final response = await api.post("${ApiEndPoint.rides}/$tripId",
        header: {ApiKey.authorization: mytoken()});
    return response;
  }




} 