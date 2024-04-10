import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';

class AnalyticsConfig {
  final Amplitude analytics = Amplitude.getInstance(instanceName: "kwangsaeng");
  void init() {
    final key = dotenv.env["AMPLITUDE_DEV_KEY"] ?? "";
    analytics.init(key);
    analytics.logEvent("Start_App");
  }

  void changePage(String fromPage, String toPage) {
    analytics.logEvent("Change_Page",
        eventProperties: {"fromPage": fromPage, "toPage": toPage});
  }
}
