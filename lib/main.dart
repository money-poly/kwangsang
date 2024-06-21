import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding_view_model.dart';
import 'package:immersion_kwangsang/screens/order/order_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await PositionProvider.instance.initMyPosition();
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
      child: MaterialApp(
        title: 'kwangsaeng',
        theme: KwangTheme.kwangTheme,
        home: isVisited
            ? MultiProvider(providers: [
                ChangeNotifierProvider(create: (_) => NavViewModel()),
                ChangeNotifierProvider(create: (_) => PositionProvider()),
                ChangeNotifierProvider(create: (_) => HomeViewModel(TickerProviderImpl())),
                ChangeNotifierProvider(create: (_) => MapMainViewModel()),
                ChangeNotifierProvider(create: (_) => OrderViewModel()),
              ], child: const NavView())
            : ChangeNotifierProvider(
                create: (_) => OnBoardingViewModel(),
                child: const OnBoarding(),
              ),
      ),
    );
  }  
}

class TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
