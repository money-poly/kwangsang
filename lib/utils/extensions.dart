import 'package:intl/intl.dart';

extension PriceParse on int {
  String price() {
    return NumberFormat('###,###,###').format(this);
  }
}
