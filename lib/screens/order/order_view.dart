import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/order/order_done_view.dart';
import 'package:immersion_kwangsang/screens/order/order_ing_view.dart';
import 'package:immersion_kwangsang/screens/order/order_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        title: Text("주문 내역", style: KwangStyle.header2),
        centerTitle: false,
        elevation: 0,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: viewModel.tabs.length,
        child: Column(
          children: [
            TabBar(
              tabs: viewModel.tabs,
              isScrollable: false,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: KwangStyle.btn2B,
              labelColor: KwangColor.primary400,
              unselectedLabelStyle: KwangStyle.btn2SB,
              unselectedLabelColor: KwangColor.grey500,
              indicatorColor: KwangColor.primary400,
              dividerColor: KwangColor.grey350,
            ),
            const Divider(
              height: 1,
              color: KwangColor.grey350,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  OrderIngView(),
                  OrderDoneView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
