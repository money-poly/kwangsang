import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/widgets/count_and_sort_title.dart';
import 'package:immersion_kwangsang/screens/home/widgets/franchise_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class FranchiseView extends StatelessWidget {
  const FranchiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        toolbarHeight: 52,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/ic_36_back.svg",
              width: 36,
              height: 36,
            ),
          ),
        ),
        title: Text(
          "파리바게트",
          style: KwangStyle.header2,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleSortBtn(sort: Order.distance, onTap: () {}) // [TODO] 구현
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
              shrinkWrap: true,
              itemBuilder: (context, idx) => const FranchiseCard(),
              separatorBuilder: (context, idx) => const SizedBox(height: 20),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
