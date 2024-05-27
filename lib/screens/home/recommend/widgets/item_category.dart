import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum ItemCategory {
  korean("한식"),
  chinese("중식"),
  japanese("일식"),
  western("양식"),
  snack("분식"),
  cafe("카페"),
  dessert("디저트"),
  franchise("프랜차이즈");

  const ItemCategory(this.str);
  final String str;
}

class ItemCategoryCol extends StatelessWidget {
  const ItemCategoryCol({super.key, required this.category});

  final ItemCategory category;
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 100) / 4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              // [TODO] 카테고리 아이콘
              width: width,
              height: width,
              color: KwangColor.grey500,
            )
            // Image.asset(
            //   "assets/im00ages/category.png",
            //   fit: BoxFit.cover,
            // ),
            ),
        const SizedBox(height: 5),
        Text(category.str, style: KwangStyle.body1M)
      ],
    );
  }
}
