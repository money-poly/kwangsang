import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/purchase/purchase_check_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/padding_title_widget.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/purchase_check_dialog.dart';
import 'package:immersion_kwangsang/screens/purchase/widgets/soldout_menu_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/number_formatter.dart';
import 'package:immersion_kwangsang/widgets/countable_menu_card.dart';
import 'package:immersion_kwangsang/widgets/custom_btn.dart';
import 'package:provider/provider.dart';

class PurchaseCheckView extends StatelessWidget {
  const PurchaseCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PurchaseCheckViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset("assets/icons/ic_36_back.svg"),
          ),
        ),
        title: Text("주문/결제", style: KwangStyle.header2),
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 52,
        toolbarHeight: 52,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PaddingTitelWidget(title: "주문 상품 총 3개"),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemBuilder: (context, idx) => CountableMenuCard(
                  menu: viewModel.tempMenus[idx],
                  type: CMenuCardType.removable,
                  add: () {},
                  subtract: () {}),
              separatorBuilder: (context, idx) => const Padding(
                padding: EdgeInsets.all(20),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: KwangColor.grey200,
                ),
              ),
              itemCount: viewModel.tempMenus.length,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, bottom: 4),
              child: Divider(
                height: 1,
                thickness: 4,
                color: KwangColor.grey200,
              ),
            ),
            const PaddingTitelWidget(title: "품절 임박 메뉴"),
            SizedBox(
              height: 210,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 26),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, idx) =>
                      SoldoutMenuCard(menu: viewModel.tempMenus[idx]),
                  separatorBuilder: (context, idx) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: 3),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, bottom: 4),
              child: Divider(
                height: 1,
                thickness: 4,
                color: KwangColor.grey200,
              ),
            ),
            const PaddingTitelWidget(title: "주문 금액"),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "상품 금액",
                        style: KwangStyle.body1M.copyWith(
                          color: KwangColor.grey600,
                        ),
                      ),
                      Text(
                        commaNumberFormatter(10000),
                        style: KwangStyle.body1M.copyWith(
                          color: KwangColor.grey600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "할인 금액",
                        style: KwangStyle.body1M
                            .copyWith(color: KwangColor.grey600),
                      ),
                      Text(
                        commaNumberFormatter(-1150),
                        style:
                            KwangStyle.body1M.copyWith(color: KwangColor.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("총 결제 금액", style: KwangStyle.header3),
                      Text(commaNumberFormatter(8850),
                          style: KwangStyle.header3),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, bottom: 8),
              child: Divider(
                height: 1,
                thickness: 4,
                color: KwangColor.grey200,
              ),
            ),
            const PaddingTitelWidget(title: "결제 수단"),
            const SizedBox(height: 8),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, idx) => GestureDetector(
                      onTap: () {
                        viewModel.selectWay(PurchaseWay.values[idx]);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: AbsorbPointer(
                              child: Radio(
                                visualDensity: VisualDensity.compact,
                                value: PurchaseWay.values[idx],
                                groupValue: viewModel.selectedWay,
                                onChanged: (value) {},
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return KwangColor.primary400;
                                    } else {
                                      return KwangColor.grey500;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            PurchaseWay.values[idx].str,
                            style: KwangStyle.body1M,
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, idx) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Divider(
                          height: 1, thickness: 1, color: KwangColor.grey300),
                    ),
                itemCount: PurchaseWay.values.length),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 26),
              child: Divider(
                height: 1,
                thickness: 4,
                color: KwangColor.grey200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "만 14세 이상 이용자, 개인정보 제공동의",
                    style: KwangStyle.body2.copyWith(
                      color: KwangColor.grey700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "광생에서 판매되는 상품은 개별 입점 판매자의 상품이 포함되어 있습니다. 해당 상품에 대해서 (주)광생은 통신판매중개자의 지위에 있고 통신판매의 당사자가 아닙니다. 해당 상품의 거래 전반에 관한 의무와 책임은 각 입점 판매자에게 있습니다.",
                      softWrap: true,
                      style: KwangStyle.body3.copyWith(
                        overflow: TextOverflow.visible,
                        color: KwangColor.grey600,
                      ),
                    ),
                  ),
                  Text(
                    "위 내용을 확인하였으며 결제에 동의합니다.",
                    style: KwangStyle.body3.copyWith(
                      color: KwangColor.grey700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 96 + MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
      bottomSheet: Container(
        color: KwangColor.grey100,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: CustomBtn(
            txt: "총 ${commaNumberFormatter(8850)} 결제하기", // [TODO] 실제 가격으로 변경
            bgColor: KwangColor.primary400,
            txtColor: KwangColor.grey100,
            unableBgColor: KwangColor.primary400,
            unableTxtColor: KwangColor.grey100,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => PurchaseCheckDialog());
            },
            isEnable: true,
            type: CustomBtnType.big),
      ),
    );
  }
}
