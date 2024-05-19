import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/screens/purchase_info/widgets/purchase_info_card_h_spliter.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class PurchaseInfoMapDetail extends StatelessWidget {
  const PurchaseInfoMapDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PurchaseInfoViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const PurchaseInfoCardHSpliter(size: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '영업 시간',
                style: KwangStyle.btn2SB,
              ),
              Text(
                '10:00~21:00',
                style: KwangStyle.btn2SB,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '픽업 시간',
                style: KwangStyle.btn2SB,
              ),
              Text(
                '14~20분',
                style: KwangStyle.btn2SB,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '나와의 거리',
                style: KwangStyle.btn2SB,
              ),
              Text(
                '1.3km',
                style: KwangStyle.btn2SB,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: KwangColor.grey300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '매장 내에서 직접 픽업해주세요',
                  style: KwangStyle.btn2B.copyWith(
                    color: KwangColor.secondary100,
                  ),
                ),
                const SizedBox(height: 10),
                _noticeText('주문이 승인된 후에는 주문 변경이나 취소가 불가합니다.'),
                const SizedBox(height: 6),
                _noticeText('픽업은 상품 준비 완료 이후 부터 가능합니다.'),
                const SizedBox(height: 6),
                _noticeText(
                    '준비 완료된 음식은 00(시간/분) 동안 매장에서 보관되며 해당 시간 내 픽업하지 않을 경우 폐기됩니다.'),
                const SizedBox(height: 6),
                _noticeText('폐기 후 제재공 및 환불은 불가합니다.'),
              ],
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _noticeText(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: KwangStyle.body2M,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            message,
            style: KwangStyle.body2M,
            maxLines: 999,
          ),
        ),
      ],
    );
  }
}
