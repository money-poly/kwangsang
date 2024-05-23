import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class SaleStoreCard extends StatelessWidget {
  const SaleStoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const CustomNetworkImage(
                  width: 36,
                  height: 36,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '파리바게트 광운대점',
                            style: KwangStyle.body2M.copyWith(
                              color: KwangColor.grey800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 18,
                          color: KwangColor.grey700,
                        ),
                      ],
                    ),
                    Text(
                      '오후 8:30 세일 시작',
                      style: KwangStyle.body2M.copyWith(
                        color: KwangColor.grey700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_20_alarm.svg",
                    colorFilter: const ColorFilter.mode(
                      KwangColor.red,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '00:15:34',
                    style: KwangStyle.btn2SB.copyWith(
                      color: KwangColor.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 188,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => Container(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
