import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngSerializer implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngSerializer();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(
      json['lat'] as double,
      json['lon'] as double,
    );
  }

  @override
  Map<String, dynamic> toJson(LatLng latLng) => {
        'lat': latLng.latitude,
        'lon': latLng.longitude,
      };
}
