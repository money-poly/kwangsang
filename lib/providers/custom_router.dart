import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/login/login_view.dart';
import 'package:immersion_kwangsang/screens/login/login_view_model.dart';
import 'package:immersion_kwangsang/screens/login/non_member_view.dart';
import 'package:immersion_kwangsang/screens/map/map_main_view_model.dart';
import 'package:immersion_kwangsang/screens/map/map_store_view.dart';
import 'package:immersion_kwangsang/screens/map/map_store_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_more_view.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view.dart';
import 'package:immersion_kwangsang/screens/menu/menu_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding_view_model.dart';
import 'package:immersion_kwangsang/screens/order/order_find_view.dart';
import 'package:immersion_kwangsang/screens/order/order_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:provider/provider.dart';

class CustomRouter {
  late final bool isVisited;
  late GoRouter router;

  CustomRouter(this.isVisited, BuildContext context) {
    final nav = Provider.of<NavViewModel>(context);
    router = GoRouter(
      initialLocation: isVisited ? "/nav" : "/onBoarding",
      observers: [RouterObserver()],
      routes: [
        GoRoute(
          path: "/nav",
          name: NavItems.values[nav.currIdx].label,
          builder: (context, state) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) => HomeViewModel(TickerProviderImpl())),
              ChangeNotifierProvider(create: (_) => MapMainViewModel()),
              ChangeNotifierProvider(create: (_) => OrderViewModel()),
            ],
            child: const NavView(),
          ),
        ),
        GoRoute(
          path: "/onBoarding",
          name: "온보딩",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => OnBoardingViewModel(),
            child: const OnBoarding(),
          ),
        ),
        GoRoute(
          path: "/search",
          name: "검색",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => SearchMainViewModel(),
            child: const SearchMainView(),
          ),
        ),
        GoRoute(
          path: "/storeDetail",
          name: "가게상세",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => MapStoreViewModel(state.extra as int),
            child: const MapStoreView(),
          ),
        ),
        GoRoute(
          path: "/menuDetail",
          name: "메뉴상세",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => MenuBottomSheetViewModel(),
            child: ChangeNotifierProvider(
              create: (_) => MenuViewModel(state.extra as int),
              child: MenuView(
                menuId: state.extra as int,
              ),
            ),
          ),
        ),
        GoRoute(
          path: "/purchase", // TODO: Temporary routing to purchase info screem
          name: "구매",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => PurchaseInfoViewModel(isMember: true),
            child: const PurchaseInfoView(),
          ),
        ),
        GoRoute(
          path: "/menuMore",
          name: "더보기",
          builder: (context, state) => ChangeNotifierProvider.value(
            value: Provider.of<MenuBottomSheetViewModel>(context),
            child: const MenuMoreView(),
          ),
        ),
        GoRoute(
          path: "/login",
          name: "로그인",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => LoginViewModel(),
            child: const LoginView(),
          ),
        ),
        GoRoute(
          path: "/nonMemberLogin",
          name: "비회원로그인",
          builder: (context, state) => const NonMemberView(),
        ),
        GoRoute(
          path: "/findOrder",
          name: "주문조회",
          builder: (context, state) => const OrderFindView(),
        ),
      ],
    );
  }
}

class RouterObserver extends NavigatorObserver {
  final analytics = AnalyticsConfig();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute == null || route.settings.name == null) return;
    analytics.changePage(previousRoute.settings.name!, route.settings.name!);
    print(
        "[ROUTE/PUSH] ${previousRoute.settings.name} > ${route.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute == null || route.settings.name == null) return;
    analytics.changePage(route.settings.name!, previousRoute.settings.name!);
    print(
        "[ROUTE/POP] ${route.settings.name} > ${previousRoute.settings.name}");
  }
}

class TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
