import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.width = 72,
    this.height = 72,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            alignment: Alignment.center,
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? const CupertinoActivityIndicator(
                    animating: true,
                    radius: 16.0,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          decoration: const BoxDecoration(
            color: KwangColor.grey300,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/imgs/img_44_bird_exclamation.png',
                  width: width * 0.7,
                  height: height * 0.7,
                ),
                Text(
                  '이미지 준비중',
                  style: TextStyle(
                    fontSize: height > 44 ? 10 : 0,
                    color: KwangColor.grey500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
