import 'package:intl/intl.dart';

extension PriceParse on int? {
  String price() {
    if (this == null) return '0';
    return NumberFormat('###,###,###').format(this);
  }
}

extension NicePayDateParse on String {
  DateTime datetime() {
    var formattedStr =
        '${substring(0, 4)}-${substring(4, 6)}-${substring(6, 8)}T${substring(8, 10)}:${substring(10, 12)}:${substring(12, 14)}'; // 초
    return DateTime.parse(formattedStr);
  }
}

extension NicePayDateToStr on DateTime {
  String toNiceStr() {
    var ediDate = '';
    ediDate += year.toString().padLeft(4, '0');
    ediDate += month.toString().padLeft(2, '0');
    ediDate += day.toString().padLeft(2, '0');
    ediDate += hour.toString().padLeft(2, '0');
    ediDate += minute.toString().padLeft(2, '0');
    ediDate += second.toString().padLeft(2, '0');
    return ediDate;
  }
}

extension DescriptionValidator on String? {
  bool isValidDesc() {
    if (this == null || this!.isEmpty) {
      return false;
    }
    return true;
  }
}

extension DateTimeHHMM on DateTime {
  String toHHMM() {
    var ediDate = '';
    ediDate += hour.toString().padLeft(2, '0');
    ediDate += ':';
    ediDate += minute.toString().padLeft(2, '0');
    return ediDate;
  }

  String toKoHHMM() {
    var ediDate = '';
    if (hour < 12) {
      ediDate += '오전 ${hour.toString().padLeft(2, '0')}';
    } else {
      var h = 0;
      if (hour == 12) {
        h = hour;
      } else {
        h = hour - 12;
      }
      ediDate += '오후 ${h.toString().padLeft(2, '0')}';
    }
    ediDate += ':';
    ediDate += minute.toString().padLeft(2, '0');
    return ediDate;
  }
}
