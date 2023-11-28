import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/providers/position_provider.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
import 'package:immersion_kwangsang/styles/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'kwangsaeng',
        theme: KwangTheme.kwangTheme,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavViewModel()),
            ChangeNotifierProvider(create: (_) => PositionProvider())
          ],
          child: const NavView(),
        ));
  }
}
