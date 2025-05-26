import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> takeLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      log('Location Permission denied by user');
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    log(
      'Location Permission PErmanently denied. Please enable from app settings',
    );
    return false;
  }
  if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always) {
    log('Location permission granted');
    return true;
  }
  log('Unexpected location permission state:$permission');
  return false;
}

Future<Position> determinePosition() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  debugPrint('✅ Location service enabled: $serviceEnabled');

  if (!serviceEnabled) {
    // Try opening settings before throwing
    await Geolocator.openLocationSettings();
    return Future.error('Location Services are disabled');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  debugPrint('🔐 Permission status: $permission');

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    debugPrint('📥 Permission after request: $permission');

    if (permission == LocationPermission.denied) {
      return Future.error('Location Permission are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location Permission are permanently denied, we cannot request permissions',
    );
  }

  final position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  debugPrint('📍 Got position: ${position.latitude}, ${position.longitude}');
  return position;
}

Future<List<Placemark>> getListPlace(Position position) async {
  final placeMarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );
  return placeMarks;
}
