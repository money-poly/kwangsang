import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

enum EMenuStatus {
  sale("판매중", KwangColor.primary400, "고객들에게 판매할 수 있는 상태"),
  hidden("숨김", KwangColor.grey600, "일시적으로 숨김처리되어 메뉴가 보이지 않는 상태"),
  soldout("품절", KwangColor.red, "메뉴는 노출되지만 품절 표시인 상태");

  const EMenuStatus(this.str, this.color, this.description);
  final String str;
  final Color color;
  final String description;

  static String? toJson(EMenuStatus? status) {
    switch (status) {
      case EMenuStatus.sale:
        return 'sale';
      case EMenuStatus.hidden:
        return 'hidden';
      case EMenuStatus.soldout:
        return 'soldout';
      case null:
        return null;
      default:
        throw Exception('[EMenuStatus.toJson] Unknown type value: $status');
    }
  }

  static EMenuStatus? fromJson(String? str) {
    switch (str) {
      case 'sale':
        return EMenuStatus.sale;
      case 'hidden':
        return EMenuStatus.hidden;
      case 'soldout':
        return EMenuStatus.soldout;
      case null:
        return null;
      default:
        throw Exception('[EMenuStatus.fromJson] Unknown string value: $str');
    }
  }
}
