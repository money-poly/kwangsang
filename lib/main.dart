import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/theme.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void main() async {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission != LocationPermission.always &&
      permission != LocationPermission.whileInUse) {
    await Geolocator.requestPermission();
  }
  AnalyticsConfig().init();
  FlutterNativeSplash.remove();
  runApp(MyApp(isVisited: prefs.getBool("visited") ?? false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isVisited});

  final bool isVisited;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavViewModel()),
        ChangeNotifierProvider(create: (_) => PositionProvider()),
      ],
      child: StyledToast(
        locale: const Locale("ko", "KR"),
        textStyle: KwangStyle.body1.copyWith(color: Colors.white),
        backgroundColor: KwangColor.grey700,
        borderRadius: BorderRadius.circular(20),
        toastAnimation: StyledToastAnimation.slideFromBottom,
        animDuration: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 1500),
        child: MaterialApp(
          title: 'kwangsaeng',
          theme: KwangTheme.kwangTheme,
          home: isVisited
              ? MultiProvider(providers: [
                  ChangeNotifierProvider(create: (_) => NavViewModel()),
                  ChangeNotifierProvider(create: (_) => PositionProvider()),
                  ChangeNotifierProvider(
                      create: (context) => HomeViewModel(context)),
                  ChangeNotifierProvider(
                      create: (context) => MapMainViewModel(context)),
                ], child: const NavView())
              : ChangeNotifierProvider(
                  create: (context) => OnBoardingViewModel(context),
                  child: const OnBoarding(),
                ),
        ),
      ),
    );
  }
}
