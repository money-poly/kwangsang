import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:immersion_kwangsang/screens/nice_pay/nice_pay_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class NicePaySuccess extends StatelessWidget {
  const NicePaySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.read<NicePayViewModel>();

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/ic_24_check_fill.svg",
                  colorFilter: const ColorFilter.mode(
                    KwangColor.primary300,
                    BlendMode.srcIn,
                  ),
                  width: 40,
                ),
                const SizedBox(height: 16),
                Text(
                  '결제가 완료되었습니다!',
                  style: KwangStyle.header3,
                ),
                const SizedBox(height: 8),
                Text(
                  '주문 정보',
                  style: KwangStyle.body3,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (_) => PurchaseInfoViewModel(isMember: true),
                    child: const PurchaseInfoView(),
                  ),
                ),
              );
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: KwangColor.primary400,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '주문 내역 확인',
                  style: KwangStyle.btn3SB.copyWith(
                    color: KwangColor.grey100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
