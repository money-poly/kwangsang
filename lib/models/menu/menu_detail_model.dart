import 'package:equatable/equatable.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/models/origin/origin_model.dart';
import 'package:immersion_kwangsang/models/store/store_menu_model.dart';

// TODO: recommend refectoring model
class MenuDetail extends Equatable {
  final String name;
  final int discountRate;
  final int discountPrice;
  final int regularPrice;
  final StoreMenu store;
  final List<Menu> anotherMenus;
  final int view;
  final List<String> cautions;
  final List<Origin> origins;
  final int count;
  final DateTime? expiredDate;
  final String? menuPictureUrl;
  final String? description;

  const MenuDetail({
    required this.name,
    required this.discountRate,
    required this.discountPrice,
    required this.regularPrice,
    required this.store,
    required this.anotherMenus,
    required this.view,
    required this.origins,
    required this.cautions,
    required this.count,
    this.expiredDate,
    this.menuPictureUrl,
    this.description,
  });

  MenuDetail copyWith({
    String? name,
    int? discountRate,
    int? discountPrice,
    int? regularPrice,
    StoreMenu? store,
    List<Menu>? anotherMenus,
    int? view,
    List<String>? cautions,
    List<Origin>? origins,
    int? count,
    DateTime? expiredDate,
    String? menuPictureUrl,
    String? description,
  }) =>
      MenuDetail(
        name: name ?? this.name,
        discountRate: discountRate ?? this.discountRate,
        discountPrice: discountPrice ?? this.discountPrice,
        regularPrice: regularPrice ?? this.regularPrice,
        store: store ?? this.store,
        anotherMenus: anotherMenus ?? this.anotherMenus,
        view: view ?? this.view,
        cautions: cautions ?? this.cautions,
        origins: origins ?? this.origins,
        count: count ?? this.count,
        expiredDate: expiredDate ?? this.expiredDate,
        menuPictureUrl: menuPictureUrl ?? this.menuPictureUrl,
        description: description ?? this.description,
      );

  factory MenuDetail.fromJson(Map<dynamic, dynamic> json) => MenuDetail(
        name: json['name'],
        discountRate: json['discountRate'],
        discountPrice: json['sellingPrice'],
        regularPrice: json['price'],
        store: StoreMenu.fromJson(json['store']),
        anotherMenus: (json['anotherMenus'] as List)
            .map((e) => Menu.fromDetailJson(e))
            .toList(),
        view: json['viewCount'],
        cautions: json['caution'].cast<String>(),
        origins: json['countryOfOrigin'] == null
            ? []
            : (json['countryOfOrigin'] as List)
                .map((e) => Origin.fromJson(e))
                .toList(),
        count: json['count'],
        /* Optional */
        expiredDate: json['expiredDate'] == null
            ? null
            : DateTime.parse(json['expiredDate']),
        menuPictureUrl: json['menuPictureUrl'],
        description: json['description'],
      );

  @override
  List<Object?> get props => [
        name,
        discountRate,
        discountPrice,
        regularPrice,
        store,
        anotherMenus,
        view,
        cautions,
        origins,
        count,
        expiredDate,
        menuPictureUrl,
        description,
      ];
}
