import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharecars/core/api/dio_consumer.dart';
import 'package:sharecars/features/maps/data/data_source/maps_data_source.dart';
import 'package:sharecars/features/maps/data/repo/map_repo.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  late MapRepoIm mapsDataSourceIm;
  LatLng? startLocation;
  LatLng? endLocation;
  List<List<LatLng>> allRoutes = [];
  int currentRouteIndex = 0;
  List<Map<String, dynamic>> routeInfos = [];

  @override
  void initState() {
    super.initState();
    mapsDataSourceIm =
        MapRepoIm(mapsDataSource: MapsDataSourceIm(api: DioConSumer()));
  }

  void _handleTap(LatLng point) async {
    setState(() {
      if (startLocation == null) {
        startLocation = point;
        endLocation = null;
        allRoutes = [];
        routeInfos = [];
      } else if (endLocation == null) {
        endLocation = point;
      } else {
        startLocation = point;
        endLocation = null;
        allRoutes = [];
        routeInfos = [];
      }
    });

    if (startLocation != null && endLocation != null) {
      final double distance = _calculateDistance(startLocation!, endLocation!);
      final bool useOpenRoute = distance < 100;

      final response = useOpenRoute
          ? await mapsDataSourceIm.fetchRouteBYOpenRouteServices(
              startLocation!, endLocation!)
          : await mapsDataSourceIm.fetchRouteBYgraphHopper(
              startLocation!, endLocation!);

      response.fold(
        (failure) {
          debugPrint("Error fetching route: ${failure.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to get route: ${failure.message}")),
          );
        },
        (routes) {
          if (routes.isEmpty) {
            debugPrint("No routes found");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("No available routes found")),
            );
            return;
          }

          setState(() {
            allRoutes = routes.map((route) => route.path).toList();
            routeInfos = routes
                .map((route) => {
                      "distance": route.distance,
                      "duration": route.duration,
                    })
                .toList();
            currentRouteIndex = 0;
          });
        },
      );
    }
  }

  double _calculateDistance(LatLng start, LatLng end) {
    const Distance distance = Distance();
    return distance(start, end) / 1000; // المسافة بالكيلومترات
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("الخريطة")),
      floatingActionButton: allRoutes.length > 1
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentRouteIndex =
                      (currentRouteIndex + 1) % allRoutes.length;
                });
              },
              tooltip: 'Switch Route',
              child: const Icon(Icons.swap_horiz),
            )
          : null,
      bottomNavigationBar: (startLocation != null && endLocation != null)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (routeInfos.isNotEmpty &&
                    currentRouteIndex < routeInfos.length)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Distance: ${(routeInfos[currentRouteIndex]["distance"] / 1000).toStringAsFixed(2)} km "
                      "- Duration: ${(routeInfos[currentRouteIndex]["duration"] / 60).toStringAsFixed(1)} min",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
              ],
            )
          : null,
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(33.5138, 36.2765),
          initialZoom: 9.2,
          onTap: (tapPosition, point) => _handleTap(point),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (startLocation != null)
            MarkerLayer(markers: [
              Marker(
                point: startLocation!,
                width: 40,
                height: 40,
                child: const Icon(Icons.location_pin,
                    color: Colors.green, size: 40),
              ),
            ]),
          if (endLocation != null)
            MarkerLayer(markers: [
              Marker(
                point: endLocation!,
                width: 40,
                height: 40,
                child:
                    const Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ]),
          if (allRoutes.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: allRoutes[currentRouteIndex],
                  color: Colors.blue,
                  strokeWidth: 4.0,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
