import 'package:dio/dio.dart';
import 'package:sharecars/core/errors/filuar.dart';

class ServerExpcptions implements Exception {
  final Filuar error;

  ServerExpcptions({required this.error});
}

void handelDioExcptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 302:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 422:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 400:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 401:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 402:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 403:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 404:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 405:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 500:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 502:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
        case 520:
          throw ServerExpcptions(error: Filuar.fromJson(e.response!.data));
      }
  }
}
