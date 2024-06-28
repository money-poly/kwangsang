import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_detail.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_map.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_map_detail.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_method.dart';
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
            onTap: () => context.pop(),
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
            const CardHSpliter(),
            const PurchaseInfoMap(),
            if (viewModel.phase == EPurchaseInfoPhase.accepted ||
                viewModel.phase == EPurchaseInfoPhase.pickup)
              const PurchaseInfoMapDetail(),
            const SizedBox(height: 6),
            const CardHSpliter(),
            const PurchaseInfoDetail(),
            const CardHSpliter(),
            const PurchaseInfoMethod(),
            SizedBox(height: MediaQuery.paddingOf(context).bottom),
            if (viewModel.phase == EPurchaseInfoPhase.pending)
              const SizedBox(height: 90),
          ],
        ),
      ),
      bottomSheet: viewModel.phase == EPurchaseInfoPhase.pending
          ? Container(
              height: 84 + MediaQuery.paddingOf(context).bottom,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 3,
                    color: KwangColor.grey300,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: KwangColor.primary100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '주문 취소',
                        style: KwangStyle.btn2B.copyWith(
                          color: KwangColor.primary400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
