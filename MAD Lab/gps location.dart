pubsec.yaml

name: myapp
description: "A new Flutter project."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.9.0

dependencies:
  flutter:
    sdk: flutter
  geolocator: ^14.0.2
  cupertino_icons: ^1.0.9
  google_api_availability: ^5.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true

main,dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;

void main() {
  runApp(GPSApp());
}

class GPSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPS Location App',
      home: GPSHomePage(),
    );
  }
}

class GPSHomePage extends StatefulWidget {
  @override
  _GPSHomePageState createState() => _GPSHomePageState();
}

class _GPSHomePageState extends State<GPSHomePage> {
  String locationText = "Press the button to get location";
  bool isPermissionPermanentlyDenied = false;

  Future<void> fetchLocation() async {
    setState(() {
      locationText = "Fetching location...";
    });
    developer.log("Starting location fetch...", name: 'my_app.location');

    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check GPS service
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      developer.log("GPS service enabled: $serviceEnabled", name: 'my_app.location');
      if (!serviceEnabled) {
        setState(() {
          locationText = "GPS is disabled. Please enable it in your device settings.";
        });
        return;
      }

      // Check permission
      permission = await Geolocator.checkPermission();
      developer.log("Location permission status: $permission", name: 'my_app.location');
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        developer.log("Requested location permission. Status: $permission", name: 'my_app.location');
        if (permission == LocationPermission.denied) {
          setState(() {
            locationText = "Permission denied. Please grant location permission to use this feature.";
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        developer.log("Location permission permanently denied.", name: 'my_app.location');
        setState(() {
          locationText = "Permission permanently denied. Open app settings to grant permission.";
          isPermissionPermanentlyDenied = true;
        });
        return;
      }

      // Get current position
      developer.log("Fetching current position...", name: 'my_app.location');
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      developer.log("Successfully fetched position: $position", name: 'my_app.location');

      setState(() {
        locationText =
            "Latitude : ${position.latitude}\nLongitude : ${position.longitude}";
        isPermissionPermanentlyDenied = false;
      });
    } catch (e, s) {
      developer.log(
        'Error fetching location',
        name: 'my_app.location',
        error: e,
        stackTrace: s,
      );
      setState(() {
        locationText = "Error fetching location: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPS Location App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: fetchLocation,
              child: Text("Get GPS Location"),
            ),
            if (isPermissionPermanentlyDenied)
              SizedBox(height: 25),
            if (isPermissionPermanentlyDenied)
              ElevatedButton(
                onPressed: () {
                  Geolocator.openAppSettings();
                },
                child: Text("Open App Settings"),
              ),
          ],
        ),
      ),
    );
  }
}

app+src+main+permission

 <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
