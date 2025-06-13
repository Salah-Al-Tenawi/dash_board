import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng? startLocation;
  LatLng? endLocation;
  List<List<LatLng>> allRoutes = [];
  int currentRouteIndex = 0;
  List<Map<String, dynamic>> routeInfos = [];

  final String orsApiKey = '5b3ce3597851110001cf62486bcd547ddd63409a97d65b9fc6b02ccd';

  void _handleTap(LatLng point) async {
    setState(() {
      if (startLocation == null) {
        startLocation = point;
        endLocation = null;
      } else if (endLocation == null) {
        endLocation = point;
      } else {
        startLocation = point;
        endLocation = null;
      }
      allRoutes = [];
      routeInfos = [];
    });

    if (startLocation != null && endLocation != null) {
      await fetchRoute();
    }
  }

  Future<void> fetchRoute() async {
    final url = Uri.parse(
        "https://api.openrouteservice.org/v2/directions/driving-car/geojson");

    final body = jsonEncode({
      "coordinates": [
        [startLocation!.longitude, startLocation!.latitude],
        [endLocation!.longitude, endLocation!.latitude]
      ],
      "alternative_routes": {
        "target_count": 3,
        "share_factor": 0.6
      }
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': orsApiKey,
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final features = data['features'] as List;

        setState(() {
          allRoutes = [];
          routeInfos = [];

          for (var feature in features) {
            final coords = feature['geometry']['coordinates'] as List;
            final latLngList = coords.map((c) => LatLng(c[1], c[0])).toList();
            allRoutes.add(latLngList);

            final props = feature['properties']['summary'];
            routeInfos.add({
              "distance": props['distance'],
              "duration": props['duration'],
            });
          }
          currentRouteIndex = 0;
        });
      } else {
        debugPrint("Failed to fetch route: ${response.statusCode}");
        debugPrint("Response body: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error fetching route: $e");
    }
  }

  void _printRouteDetails() {
    if (allRoutes.isEmpty || currentRouteIndex >= allRoutes.length) return;

    final currentRoute = allRoutes[currentRouteIndex];
    debugPrint("Start Location: ${startLocation!.latitude}, ${startLocation!.longitude}");
    debugPrint("End Location: ${endLocation!.latitude}, ${endLocation!.longitude}");
    debugPrint("Route Points Count: ${currentRoute.length}");
    for (int i = 0; i < currentRoute.length; i++) {
      debugPrint("Point $i: ${currentRoute[i].latitude}, ${currentRoute[i].longitude}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Planner")),
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
                if (routeInfos.isNotEmpty && currentRouteIndex < routeInfos.length)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Distance: ${(routeInfos[currentRouteIndex]["distance"] / 1000).toStringAsFixed(2)} km "
                      "- Duration: ${(routeInfos[currentRouteIndex]["duration"] / 60).toStringAsFixed(1)} min",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _printRouteDetails,
                    child: const Text("Print Route Details"),
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
                child: const Icon(Icons.location_pin,
                    color: Colors.red, size: 40),
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