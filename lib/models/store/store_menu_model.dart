import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// TODO: recommend refectoring model
class StoreMenu extends Equatable {
  final int id;
  final String name;
  final String address;
  final LatLng latLng;
  final String pickUpTime;
  final String phone;

  const StoreMenu({
    required this.id,
    required this.name,
    required this.address,
    required this.latLng,
    required this.pickUpTime,
    required this.phone,
  });

  StoreMenu copyWith({
    int? id,
    String? name,
    String? address,
    LatLng? latLng,
    String? pickUpTime,
    String? phone,
  }) =>
      StoreMenu(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        latLng: latLng ?? this.latLng,
        pickUpTime: pickUpTime ?? this.pickUpTime,
        phone: phone ?? this.phone,
      );

  factory StoreMenu.fromJson(Map<String, dynamic> json) {
    return StoreMenu(
      id: json['id'],
      name: json['name'],
      address: json['detail']['address'] +
          (json['detail']['addressDetail'] == null
              ? ""
              : " ${json['detail']['addressDetail']}"),
      latLng: LatLng(
        double.parse(json['detail']['lat']),
        double.parse(json['detail']['lon']),
      ),
      pickUpTime: json['detail']['pickUpTime'],
      phone: json['detail']['phone'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        latLng,
        pickUpTime,
        phone,
      ];
}
