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
  bool _isPermissionGranted = false;

  Position? get myPosition => _myPosition;

  PositionProvider() {
    initMyPosition().then((value) {
      notifyListeners();
    });
  }

  Future initMyPosition() async {
    await getLocationPermission();
    await updateMyPosition();
  }

  Future getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      _isPermissionGranted = true;
    } else if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }

    notifyListeners();
  }

  Future<void> updateMyPosition() async {
    if (_isPermissionGranted) {
      _myPosition = await Geolocator.getCurrentPosition();
    } else {
      _myPosition = _kwuPosition;
    }
    notifyListeners();
  }
}
