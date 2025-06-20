
import 'package:latlong2/latlong.dart';
import 'package:sharecars/core/api/api_end_points.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/features/maps/data/model/map_info_model.dart';

abstract class MapsDataSource {
  final DioConSumer api;

  MapsDataSource({required this.api});
  Future<List<RouteModel>> fetchRouteBYOpenRouteServices(
      LatLng startLocation, LatLng endLocation);
  Future<List<RouteModel>> fetchRouteBYgraphHopper(
      LatLng startLocation, LatLng endLocation);
}

class MapsDataSourceIm extends MapsDataSource {
  final String ghrapHopperApiKey = "a387f47a-e76a-492a-8e1f-275d1d3be3f3";
  final String orsApiKey =
      '5b3ce3597851110001cf62486bcd547ddd63409a97d65b9fc6b02ccd';

  MapsDataSourceIm({required super.api});

  @override
  Future<List<RouteModel>> fetchRouteBYOpenRouteServices(
      LatLng startLocation, LatLng endLocation) async {
    final response = await api.post(
      ApiEndPoint.mapsOpenRouteServices,
      header: {
        ApiKey.authorization: orsApiKey,
      },
      data: {
        ApiKey.coordinates: [
          [startLocation.longitude, startLocation.latitude],
          [endLocation.longitude, endLocation.latitude]
        ],
        ApiKey.alternativeRoutes: {
          ApiKey.targetCount: 3,
          ApiKey.shareFactor: 0.6,
        },
      },
    );

    final features = response[ApiKey.features] as List;

    final List<RouteModel> routes = features
        .map<RouteModel>((feature) => RouteModel.fromOpenRouteServices(feature))
        .toList();

    return routes;
  }

  @override
  Future<List<RouteModel>> fetchRouteBYgraphHopper(
      LatLng startLocation, LatLng endLocation) async {
    final response = await api.get(
      ApiEndPoint.mapsGraphHopper,
      queryParameters: {
        'point': [
          '${startLocation.latitude},${startLocation.longitude}',
          '${endLocation.latitude},${endLocation.longitude}'
        ],
        'vehicle': 'car',
        'locale': 'en',
        'points_encoded': 'false',
        'alternative_route.max_paths': '3',
        'alternative_route.max_weight_factor': '1.6',
        'alternative_route.max_share_factor': '0.8',
        'key': ghrapHopperApiKey,
      },
    );

    final paths = response['paths'] as List;
    return paths
        .map<RouteModel>((path) => RouteModel.fromGraphHopper(path))
        .toList();
  }
}


 

 


  // Future<void> fetchOpenRouteServicesRoute() async {
  //   final dio = Dio();

  //   try {
  //     final response = await dio.post(
  //       "https://api.openrouteservice.org/v2/directions/driving-car/geojson",
  //       options: Options(
  //         headers: {
  //           'Authorization': orsApiKey,
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //       data: {
  //         "coordinates": [
  //           [startLocation!.longitude, startLocation!.latitude],
  //           [endLocation!.longitude, endLocation!.latitude]
  //         ],
  //         "alternative_routes": {"target_count": 3, "share_factor": 0.6}
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       final features = data['features'] as List;

  //       setState(() {
  //         allRoutes = [];
  //         routeInfos = [];

  //         for (var feature in features) {
  //           final coords = feature['geometry']['coordinates'] as List;
  //           final latLngList = coords.map((c) => LatLng(c[1], c[0])).toList();
  //           allRoutes.add(latLngList);

  //           final props = feature['properties']['summary'];
  //           routeInfos.add({
  //             "distance": props['distance'],
  //             "duration": props['duration'],
  //           });
  //         }
  //         currentRouteIndex = 0;
  //       });
  //     } else {
  //       debugPrint("Failed to fetch route: ${response.statusCode}");
  //       debugPrint("Response body: ${response.data}");
  //     }
  //   } on DioException catch (e) {
  //     debugPrint("Error fetching route: ${e.message}");
  //     if (e.response != null) {
  //       debugPrint("Status code: ${e.response!.statusCode}");
  //       debugPrint("Response data: ${e.response!.data}");
  //     }
  //   } catch (e) {
  //     debugPrint("Unexpected error: $e");
  //   }
  // }

//   Future<void> fetchGraphHopperRoute() async {
//     final url = Uri.parse(
//       "https://graphhopper.com/api/1/route"
//       "?point=${startLocation!.latitude},${startLocation!.longitude}"
//       "&point=${endLocation!.latitude},${endLocation!.longitude}"
//       "&vehicle=car"
//       "&locale=en"
//       "&points_encoded=false"
//       "&alternative_route.max_paths=3"
//       "&alternative_route.max_weight_factor=1.6"
//       "&alternative_route.max_share_factor=0.8"
//       "&key=$ghrapHopperApiKey",
//     );

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final paths = data['paths'] as List;

//         setState(() {
//           allRoutes = [];
//           routeInfos = [];

//           for (var path in paths) {
//             final points = path['points']['coordinates'] as List;
//             final latLngList = points.map((p) => LatLng(p[1], p[0])).toList();

//             allRoutes.add(latLngList);
//             routeInfos.add({
//               "distance": path['distance'],
//               "duration": path['time'] / 1000, // seconds
//             });
//           }

//           currentRouteIndex = 0;
//         });
//       } else {
//         debugPrint("Failed to fetch route: ${response.statusCode}");
//         debugPrint("Body: ${response.body}");
//       }
//     } catch (e) {
//       debugPrint("Error fetching route: $e");
//     }
//   }
// }
