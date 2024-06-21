import 'package:fluttertoast/fluttertoast.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class CustomToast extends Fluttertoast {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: KwangColor.grey900.withOpacity(0.8),
      textColor: KwangColor.grey100,
      fontSize: 16.0,
    );
  }
}
