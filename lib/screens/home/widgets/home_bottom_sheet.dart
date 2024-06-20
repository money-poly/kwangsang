import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.fromLTRB(20, 0, 16, 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: KwangColor.grey100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: 44,
            height: 6,
            decoration: BoxDecoration(
              color: KwangColor.grey300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Column(
            children: List.generate(
              Order.values.length,
              (idx) => GestureDetector(
                onTap: () {
                  // viewModel.changeOrder(Order.values[idx]);
                  Navigator.of(context).pop();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  margin: idx == Order.values.length - 1
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(Order.values[idx].str,
                            style: KwangStyle.btn1SB),
                      ),
                      // if (viewModel.order == Order.values[idx])
                      //   SvgPicture.asset(
                      //     "assets/icons/ic_36_check.svg",
                      //     width: 36,
                      //     height: 36,
                      //     colorFilter: const ColorFilter.mode(
                      //         KwangColor.primary300, BlendMode.srcIn),
                      //   )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
