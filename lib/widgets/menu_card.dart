import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/styles/color.dart';

enum MenuCardType {
  vertical,
  horizontal,
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu, required this.type});
  final Menu menu;
  final MenuCardType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case MenuCardType.horizontal:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 132,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: KwangColor.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    menu.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: KwangColor.grey600,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 4,
                    children: [
                      if (menu.discountRate != 0)
                        Text(
                          "${menu.discountRate}%",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: KwangColor.red,
                          ),
                        ),
                      Text(
                        menu.price.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: ExtendedImage.network(
                  menu.imgUrl,
                  fit: BoxFit.cover,
                  border: Border.all(color: KwangColor.grey300, width: 1),
                ),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}