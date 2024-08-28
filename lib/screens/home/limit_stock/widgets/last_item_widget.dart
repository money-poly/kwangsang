import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class LastItemWidget extends StatelessWidget {
  final Menu menu;

  const LastItemWidget({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: KwangColor.grey500,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomNetworkImage(
                imageUrl: menu.imgUrl,
                width: 92,
                height: 92,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        menu.store ?? '',
                        style: KwangStyle.body2M.copyWith(
                          color: KwangColor.grey600,
                        ),
                      ),
                    ),
                    CountTagWidget(count: menu.count ?? 0),
                  ],
                ),
                Text(
                  menu.name,
                  style: KwangStyle.btn2SB,
                ),
                const Expanded(child: SizedBox()),
                CustomPaint(
                  size: const Size.fromHeight(38),
                  painter: _DiscountPainter(
                    regualarPrice: menu.regularPrice!,
                    discountPrice: menu.discountPrice,
                    discountRate: menu.discountRate,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscountPainter extends CustomPainter {
  final int regualarPrice;
  final int discountPrice;
  final int discountRate;

  _DiscountPainter({
    required this.regualarPrice,
    required this.discountPrice,
    required this.discountRate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint discountPrice
    var discountPricePainter = TextPainter()
      ..text = TextSpan(
        text: '${discountPrice.price()}원',
        style: KwangStyle.header3,
      )
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();
    var xCenter = size.width - discountPricePainter.width;
    var yCenter = size.height - discountPricePainter.height;
    var offset = Offset(xCenter, yCenter);
    discountPricePainter.paint(canvas, offset);

    // Paint discountRate
    var discountRatePainter = TextPainter()
      ..text = TextSpan(
        text: '$discountRate%',
        style: KwangStyle.header3.copyWith(
          color: KwangColor.red,
        ),
      )
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();
    xCenter = xCenter - 6 - discountRatePainter.width;
    yCenter = size.height - discountRatePainter.height;
    offset = Offset(xCenter, yCenter);
    discountRatePainter.paint(canvas, offset);

    // Paint regularPrice
    var regularPricePainter = TextPainter()
      ..text = TextSpan(
        text: '${regualarPrice.price()}원',
        style: KwangStyle.btn3.copyWith(
          color: KwangColor.grey700,
          fontWeight: FontWeight.w600,
        ),
      )
      ..textDirection = TextDirection.ltr
      ..textAlign = TextAlign.center
      ..layout();
    var regXCenter = 0.0;
    var regYCenter = 0.0;
    offset = Offset(regXCenter, regYCenter);
    regularPricePainter.paint(canvas, offset);

    // Paint discountLine
    var line = Paint()
      ..color = KwangColor.grey700
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 1;

    var lineStartOffset = Offset(
      regXCenter,
      regYCenter + regularPricePainter.height / 2,
    );
    var lineEndOffset = Offset(
      regXCenter + regularPricePainter.width + 10,
      regYCenter + regularPricePainter.height / 2,
    );
    canvas.drawLine(lineStartOffset, lineEndOffset, line);

    lineStartOffset = lineEndOffset;
    lineEndOffset = Offset(
      lineStartOffset.dx - 20,
      yCenter + discountRatePainter.height / 2,
    );
    canvas.drawLine(lineStartOffset, lineEndOffset, line);

    lineStartOffset = lineEndOffset;
    lineEndOffset = Offset(
      xCenter - 10,
      lineStartOffset.dy,
    );
    canvas.drawLine(lineStartOffset, lineEndOffset, line);

    var trianglePath = Path()
      ..moveTo(lineEndOffset.dx, lineEndOffset.dy)
      ..lineTo(lineEndOffset.dx, lineEndOffset.dy + 4)
      ..lineTo(lineEndOffset.dx + 4, lineEndOffset.dy)
      ..lineTo(lineEndOffset.dx, lineEndOffset.dy - 4)
      ..lineTo(lineEndOffset.dx, lineEndOffset.dy);
    canvas.drawPath(trianglePath, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
