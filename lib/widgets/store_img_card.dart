import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum ImgCardType {
  store("가게"),
  menu("메뉴");

  const ImgCardType(this.label);
  final String label;
}

class ImgCard extends StatelessWidget {
  const ImgCard({super.key, required this.imgUrl, required this.type});

  final String? imgUrl;
  final ImgCardType type;
  @override
  Widget build(BuildContext context) {
    return imgUrl == null
        ? Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              border: Border.all(color: KwangColor.grey400, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/imgs/img_86_bird_exclamation.png",
                  width: 28,
                  height: 28,
                ),
                Text(
                  "${type.label} 사진이\n없어요",
                  style: KwangStyle.body3M.copyWith(color: KwangColor.grey600),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ExtendedImage.network(
              imgUrl!,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
              cache: true,
            ),
          );
  }
}
