import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class PurchaseInfoMethod extends StatelessWidget {
  const PurchaseInfoMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Text(
            '결제 수단',
            style: KwangStyle.header2,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '카드 결제',
                style: KwangStyle.body1M.copyWith(
                  color: KwangColor.grey800,
                ),
              ),
              Text(
                '우리카드 9820 2341 **** ****',
                style: KwangStyle.body1M.copyWith(
                  color: KwangColor.grey500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
