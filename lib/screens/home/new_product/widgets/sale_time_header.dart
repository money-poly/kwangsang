import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';

class SaleTimeHeader extends StatelessWidget {
  final DateTime saleTime;
  final int storeCounts;

  const SaleTimeHeader({
    super.key,
    required this.saleTime,
    required this.storeCounts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: KwangColor.primary300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            '${saleTime.toKoHHMM()} 시작 매장',
            style: KwangStyle.btn2SB.copyWith(
              color: KwangColor.grey100,
            ),
          ),
          Container(
            width: 1,
            height: 14,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: KwangColor.primary200,
          ),
          Text(
            '$storeCounts곳',
            style: KwangStyle.btn2SB.copyWith(
              color: KwangColor.primary100,
            ),
          ),
        ],
      ),
    );
  }
}
