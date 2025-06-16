
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
class GhraphHopperMap extends StatefulWidget { 
  

  const GhraphHopperMap({super.key});

  @override
  State<GhraphHopperMap> createState() => _GhraphHopperMapState();
}

class _GhraphHopperMapState extends State<GhraphHopperMap> {
  final String ghrapHopperApiKey = "a387f47a-e76a-492a-8e1f-275d1d3be3f3"; 
  LatLng? startLocation;
  LatLng? endLocation;
  List<List<LatLng>> allRoutes = [];
  int currentRouteIndex = 0;
  List<Map<String, dynamic>> routeInfos = [];
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
      await fetchGraphHopperRoute ();
    }
  }
 Future<void> fetchGraphHopperRoute() async {
  final url = Uri.parse(
    "https://graphhopper.com/api/1/route"
    "?point=${startLocation!.latitude},${startLocation!.longitude}"
    "&point=${endLocation!.latitude},${endLocation!.longitude}"
    "&vehicle=car"
    "&locale=en"
    "&points_encoded=false"
    "&alternative_route.max_paths=3"
    "&alternative_route.max_weight_factor=1.6"
    "&alternative_route.max_share_factor=0.8"
    "&key=$ghrapHopperApiKey",
  );

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final paths = data['paths'] as List;

      setState(() {
        allRoutes = [];
        routeInfos = [];

        for (var path in paths) {
          final points = path['points']['coordinates'] as List;
          final latLngList = points.map((p) => LatLng(p[1], p[0])).toList();

          allRoutes.add(latLngList);
          routeInfos.add({
            "distance": path['distance'],
            "duration": path['time'] / 1000, // seconds
          });
        }

        currentRouteIndex = 0;
      });
    } else {
      debugPrint("Failed to fetch route: ${response.statusCode}");
      debugPrint("Body: ${response.body}");
    }
  } catch (e) {
    debugPrint("Error fetching route: $e");
  }
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





