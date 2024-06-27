import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class KwangTheme {
  static final kwangTheme = ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: KwangColor.grey100,
      canvasColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: KwangColor.grey100,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          )));
}
