import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_card_h_spliter.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_detail.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_map.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_map_detail.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_progress_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class PurchaseInfoView extends StatelessWidget {
  const PurchaseInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PurchaseInfoViewModel>(context);
    return Scaffold(
      backgroundColor: KwangColor.grey100,
      appBar: AppBar(
        title: Text(
          viewModel.isMember ? '주문 내역' : '비회원 주문 조회',
          style: KwangStyle.header2,
        ),
        toolbarHeight: 52,
        titleSpacing: 8,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              "assets/icons/ic_36_back.svg",
              width: 36,
              height: 36,
            ),
          ),
        ),
        leadingWidth: 44,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PurchaseInfoProgressWidget(),
            const PurchaseInfoCardHSpliter(),
            const PurchaseInfoMap(),
            if (viewModel.phase == EPurchaseInfoPhase.accepted ||
                viewModel.phase == EPurchaseInfoPhase.pickup)
              const PurchaseInfoMapDetail(),
            const SizedBox(height: 6),
            const PurchaseInfoCardHSpliter(),
            const PurchaseInfoDetail(),
            const PurchaseInfoCardHSpliter(),
            SizedBox(height: MediaQuery.paddingOf(context).bottom),
          ],
        ),
      ),
    );
  }
}
