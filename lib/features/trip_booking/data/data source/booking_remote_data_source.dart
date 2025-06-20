// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';

class BookingRemoteDataSource {
  final ApiConSumer api;
  const BookingRemoteDataSource({
    required this.api,
  });
  Future<dynamic> booking(int seats, int tripID) async {
    final response = await api.post("${ApiEndPoint.rides}/$tripID/book",  
    data: {ApiKey.seats: seats});
    return response;
  }
}
