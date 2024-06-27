import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/utils/latlon_serializer.dart';

part 'store_simple.freezed.dart';
part 'store_simple.g.dart';

@freezed
class StoreSimple with _$StoreSimple {
  factory StoreSimple({
    required int id,
    required String name,
    @LatLngSerializer() required LatLng latLng,
  }) = _StoreSimple;

  factory StoreSimple.fromJson(Map<String, dynamic> json) =>
      _$StoreSimpleFromJson(json);
}
