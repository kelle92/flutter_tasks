import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  late bool servicePermision = false;
  late LocationPermission locationPermission;

  Future<Position> _getCurrentLocation() async {
    servicePermision = await Geolocator.isLocationServiceEnabled();
    if (!servicePermision) {
      print("Service disabled");
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }
}

void getUserLocation() async {
  LocationServices geopositioning = LocationServices();

  Position userLocation = await geopositioning._getCurrentLocation();

  final double userLocationLatitude = userLocation.latitude;
  final double userLocationLongitude = userLocation.longitude;

  ///Testing
  print(userLocationLatitude);
  print(userLocationLongitude);
}

//Dispaying pin on map based on input (latitude, longitude)
class MapWidget extends StatelessWidget {
  const MapWidget(this.lat, this.lng, {super.key});

  final double lat;
  final double lng;

  @override
  Widget build(context) {
/////
    getUserLocation();
////
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(center: LatLng(lat, lng), zoom: 12),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: LatLng(lat, lng),
                          builder: (context) => const Icon(Icons.pin_drop))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
