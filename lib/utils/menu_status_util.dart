import 'package:immersion_kwangsang/models/menu/menu_model.dart';

MenuStatus strToMenuStatus(String str) {
  switch (str) {
    case 'sale':
      return MenuStatus.sale;
    case 'hidden':
      return MenuStatus.hidden;
    case 'soldout':
      return MenuStatus.soldout;
    default:
      return MenuStatus.hidden;
  }
}
