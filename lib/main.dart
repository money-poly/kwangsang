import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:immersion_kwangsang/providers/custom_router.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
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
      child: MaterialApp.router(
        title: 'kwangsaeng',
        theme: KwangTheme.kwangTheme,
        routerConfig: CustomRouter(isVisited).router,
      ),
    );
  }
}
