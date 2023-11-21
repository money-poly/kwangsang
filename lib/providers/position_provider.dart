import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionProvider with ChangeNotifier {
  Position? _myPosition;
  final Position _kwuPosition = Position(
      longitude: 127.06091701329066,
      latitude: 37.61975269040579,
      timestamp: DateTime(1934, 5, 20),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);
  Position? get myPosition => _myPosition;

  PositionProvider() {
    getLocationPermission();
  }

  Future<void> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
    } else if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      _myPosition = _kwuPosition;
    } else {
      _myPosition = await Geolocator.getCurrentPosition();
    }
    print("[TEST] ${_myPosition!.latitude}, ${_myPosition!.longitude}");
    notifyListeners();
  }

  Future<void> updateMyPosition() async {
    _myPosition = await Geolocator.getCurrentPosition();
    notifyListeners();
  }
}
