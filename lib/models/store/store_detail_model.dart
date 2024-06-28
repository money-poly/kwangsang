import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/origin/origin_model.dart';

// TODO: recommend refectoring model
class StoreDetail extends Equatable {
  final int id;
  final String name;
  final List<String> categories;
  final String address; // address + addressDetail
  final LatLng latLng;
  final String pickUpTime;
  final String openTime;
  final String closeTime;
  final List<Menu> menu;
  final List<String> notes;
  final List<Origin> origins;
  final String phone;
  /* Optional */
  final String? imgUrl;
  final String? description;

  const StoreDetail({
    required this.id,
    required this.name,
    required this.categories,
    required this.address,
    required this.latLng,
    required this.pickUpTime,
    required this.openTime,
    required this.closeTime,
    required this.menu,
    required this.notes,
    required this.origins,
    required this.phone,
    this.imgUrl,
    this.description,
  });

  StoreDetail copyWith({
    int? id,
    String? name,
    List<String>? categories,
    String? address,
    LatLng? latLng,
    String? pickUpTime,
    String? openTime,
    String? closeTime,
    List<Menu>? menu,
    List<String>? notes,
    List<Origin>? origins,
    String? phone,
    String? imgUrl,
    String? description,
  }) =>
      StoreDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        categories: categories ?? this.categories,
        address: address ?? this.address,
        latLng: latLng ?? this.latLng,
        pickUpTime: pickUpTime ?? this.pickUpTime,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        menu: menu ?? this.menu,
        notes: notes ?? this.notes,
        origins: origins ?? this.origins,
        phone: phone ?? this.phone,
        imgUrl: imgUrl ?? this.imgUrl,
        description: description ?? this.description,
      );

  factory StoreDetail.fromJson(Map<dynamic, dynamic> json) {
    final origins = (json['menus'] as List)
        .expand((e) => e['countryOfOrigin'] ?? [])
        .toList()
        .map((e) => Origin.fromJson(e))
        .toList();

    return StoreDetail(
      id: json['id'],
      name: json['name'],
      categories: (json['categories'] as List)
          .map((e) => e['name'].toString())
          .toList(),
      address: json['detail']['address'] +
          (json['detail']['addressDetail'] == null
              ? ""
              : " ${json['detail']['addressDetail']}"),
      latLng: LatLng(
        double.parse(json['detail']['lat']),
        double.parse(json['detail']['lon']),
      ),
      pickUpTime: json['detail']['pickUpTime'],
      openTime: json['detail']['operationTimes']['startedAt'],
      closeTime: json['detail']['operationTimes']['endedAt'],
      menu: (json['menus'] as List).map((e) => Menu.fromStoreJson(e)).toList(),
      notes: (json['caution'] as List).map((e) => e.toString()).toList(),
      origins: origins,
      phone: json['detail']['phone'],
      /* Optional */
      imgUrl: json['detail']['storePictureUrl'],
      description: json['detail']['description'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        categories,
        address,
        latLng,
        pickUpTime,
        openTime,
        closeTime,
        menu,
        notes,
        origins,
        phone,
        imgUrl,
        description,
      ];
}
