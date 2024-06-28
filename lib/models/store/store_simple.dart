import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreSimple extends Equatable {
  final int id;
  final String name;
  final LatLng latLng;

  const StoreSimple({
    required this.id,
    required this.name,
    required this.latLng,
  });

  StoreSimple copyWith({
    int? id,
    String? name,
    LatLng? latLng,
  }) =>
      StoreSimple(
        id: id ?? this.id,
        name: name ?? this.name,
        latLng: latLng ?? this.latLng,
      );

  factory StoreSimple.fromJson(Map<String, dynamic> json) => StoreSimple(
        id: json['id'],
        name: json['name'],
        latLng: LatLng(
          json['lat'],
          json['lon'],
        ),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        latLng,
      ];
}
