import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class MenuImgCard extends StatelessWidget {
  const MenuImgCard({super.key, required this.imgUrl, required this.size});

  final String? imgUrl;
  final double size;
  @override
  Widget build(BuildContext context) {
    if (imgUrl == null) {
      return Container(
        height: size,
        width: size,
        padding: const EdgeInsets.only(top: 3, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: KwangColor.grey350),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/imgs/img_44_bird_exclamation.png",
                width: 44, height: 44),
            const Text(
              "이미지 준비중",
              style: TextStyle(
                  fontSize: 10, height: 14 / 10, color: KwangColor.grey500),
            )
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: KwangColor.grey300),
            borderRadius: BorderRadius.circular(4)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: ExtendedImage.network(
            imgUrl!,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
