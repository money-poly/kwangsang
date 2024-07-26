import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/enums/menu_sort_option.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class SortButtonSheet extends StatelessWidget {
  final EMenuSortOption selectedOption;
  final Function(EMenuSortOption selectedOption)? onChanged;

  const SortButtonSheet({
    super.key,
    this.selectedOption = EMenuSortOption.price,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: KwangColor.grey100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 6,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: KwangColor.grey400,
            ),
          ),
          for (var option in EMenuSortOption.values)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                onChanged?.call(option);
                context.pop();
              },
              child: _sortOptionBtn(
                option: option,
                isSelected: selectedOption == option,
              ),
            ),
          SizedBox(
            height: MediaQuery.viewPaddingOf(context).bottom,
          )
        ],
      ),
    );
  }

  Widget _sortOptionBtn({
    required EMenuSortOption option,
    required bool isSelected,
  }) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option.text,
            style: KwangStyle.btn1SB,
          ),
          if (isSelected)
            SvgPicture.asset(
              "assets/icons/ic_36_check.svg",
              width: 36,
              height: 36,
              colorFilter: const ColorFilter.mode(
                KwangColor.primary400,
                BlendMode.srcIn,
              ),
            ),
        ],
      ),
    );
  }

  static open(
    BuildContext context, {
    EMenuSortOption selectedOption = EMenuSortOption.price,
    Function(EMenuSortOption selectedOption)? onChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SortButtonSheet(
        selectedOption: selectedOption,
        onChanged: onChanged,
      ),
    );
  }
}
