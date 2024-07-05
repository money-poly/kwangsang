import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionProvider with ChangeNotifier {
  late Position _myPosition;
  late BitmapDescriptor _markerOffIcon;
  late BitmapDescriptor _markerOnIcon;

  static final PositionProvider instance = PositionProvider._internal();
  factory PositionProvider() => instance;

  PositionProvider._internal();

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

  Position get myPosition => _myPosition;
  BitmapDescriptor get markerOffIcon => _markerOffIcon;
  BitmapDescriptor get markerOnIcon => _markerOnIcon;

  Future<void> init() async {
    await initMyPosition();
    await initMarkerIcon();
  }

  Future<void> initMyPosition() async {
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

  Future<void> initMarkerIcon() async {
    _markerOffIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(30, 35)),
        "assets/imgs/img_30_marker_off.png");
    _markerOnIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(50, 58)),
        "assets/imgs/img_50_marker_on.png");
    notifyListeners();
  }
}
