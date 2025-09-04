import 'package:dio/dio.dart';
import 'package:sharecars/core/api/api_consumer.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/api/api_interceptor.dart';
import 'package:sharecars/core/errors/excptions.dart';

class DioConSumer extends ApiConSumer {
  late Dio dio;

  DioConSumer() {
    dio = Dio();
    dio.options.baseUrl = ApiEndPoint.baserUrl;
    dio.options.extra["withCredentials"] = true;
    dio.interceptors.add(ApiInterCeptor());
    dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true));
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
    bool isFomrData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFomrData == true ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );

      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
    bool isFomrData = false,
  }) async {
    try {
      final response = await dio.delete(path,
          data: isFomrData == true ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: Options(headers: header));
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool isFomrData = false,
  }) async {
    try {
      final response = await dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(path,
          data: isFormData == true ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: Options(headers: header));
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(path,
          data: isFormData == true ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
          options: Options(headers: header));
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }
}


// class DioConSumer extends ApiConSumer {
//   late Dio dio;

//   DioConSumer() {
//     _initializeDio();
//   }

//   void _initializeDio() {
//     dio = Dio();

//     // Configure base URL
//     dio.options.baseUrl = ApiEndPoint.baserUrl;

//     // Configure default headers and options for web session handling
//     dio.options.headers.addAll({
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     });

//     // Enable credentials for cross-origin requests (critical for web sessions)
//     // dio.options.extra['withCredentials'] = true;

//     // Add your custom interceptors
//     dio.interceptors.add(ApiInterCeptor());

//     // Add logging interceptor for debugging
//     dio.interceptors.add(LogInterceptor(
//       request: true,
//       responseBody: true,
//       requestBody: true,
//       requestHeader: true,
//       responseHeader: true,
//       error: true,
//     ));
//   }

//   @override
//   Future post(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? header,
//     Map<String, dynamic>? queryParameters,
//     bool isFomrData = false,
//   }) async {
//     try {
//       final response = await dio.post(
//         path,
//         data: isFomrData == true ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: header,
//           extra: {'withCredentials': true}, // Essential for session cookies
//         ),
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handelDioExcptions(e);
//     }
//   }

//   @override
//   Future delete(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? header,
//     Map<String, dynamic>? queryParameters,
//     bool isFomrData = false,
//   }) async {
//     try {
//       final response = await dio.delete(
//         path,
//         data: isFomrData == true ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: header,
//           extra: {'withCredentials': true}, // Essential for session cookies
//         ),
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handelDioExcptions(e);
//     }
//   }

//   @override
//   Future get(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? queryParameters,
//     bool isFomrData = false,
//   }) async {
//     try {
//       final response = await dio.get(
//         path,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: headers,
//           extra: {
//             'withCredentials': true
//           }, // This is crucial for session cookies
//         ),
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handelDioExcptions(e);
//     }
//   }

//   @override
//   Future patch(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.patch(
//         path,
//         data: isFormData == true ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: header,
//           extra: {'withCredentials': true}, // Essential for session cookies
//         ),
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handelDioExcptions(e);
//     }
//   }

//   @override
//   Future put(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.put(
//         path,
//         data: isFormData == true ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//         options: Options(
//           headers: header,
//           extra: {'withCredentials': true}, // Essential for session cookies
//         ),
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handelDioExcptions(e);
//     }
//   }
// }
