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
import 'package:immersion_kwangsang/screens/navigation/onboarding.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding_view_model.dart';
import 'package:immersion_kwangsang/screens/order/order_find_view.dart';
import 'package:immersion_kwangsang/screens/order/order_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:provider/provider.dart';

class CustomRouter {
  late final bool isVisited;
  late final GoRouter router;

  CustomRouter(this.isVisited) {
    router = GoRouter(
      initialLocation: isVisited ? "/nav" : "/onBoarding",
      routes: [
        GoRoute(
          path: "/nav",
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
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => OnBoardingViewModel(),
            child: const OnBoarding(),
          ),
        ),
        GoRoute(
          path: "/search",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => SearchMainViewModel(),
            child: const SearchMainView(),
          ),
        ),
        GoRoute(
          path: "/storeDetail",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => MapStoreViewModel(state.extra as int),
            child: const MapStoreView(),
          ),
        ),
        GoRoute(
          path: "/menuDetail",
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
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => PurchaseInfoViewModel(isMember: true),
            child: const PurchaseInfoView(),
          ),
        ),
        GoRoute(
          path: "/menuMore",
          builder: (context, state) => ChangeNotifierProvider.value(
            value: Provider.of<MenuBottomSheetViewModel>(context),
            child: const MenuMoreView(),
          ),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => LoginViewModel(),
            child: const LoginView(),
          ),
        ),
        GoRoute(
          path: "/nonMemberLogin",
          builder: (context, state) => const NonMemberView(),
        ),
        GoRoute(
          path: "/findOrder",
          builder: (context, state) => const OrderFindView(),
        ),
      ],
    );
  }
}

class TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
