import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:immersion_kwangsang/widgets/count_tag_widget.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class LastProductsCard extends StatelessWidget {
  const LastProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '마지막 찬스! 딱 한개 남았어요',
            style: KwangStyle.header2,
          ),
          const SizedBox(height: 16),
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        KwangColor.primary400,
                        KwangColor.primary250,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [
                      KwangColor.primary50,
                      KwangColor.grey100,
                      KwangColor.primary100,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _LastProductItem(
                    menu: Menu(
                      id: index,
                      store: 'GS25',
                      name: '우유생크림빵',
                      imgUrl: null,
                      discountRate: 10,
                      discountPrice: 2520,
                      regularPrice: 11000,
                      count: 1,
                    ),
                  ),
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: CardHSpliter(
                      size: 1,
                      color: KwangColor.grey500,
                    ),
                  ),
                  itemCount: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: KwangColor.grey400,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '상품 더 보기',
                      style: KwangStyle.btn3SB.copyWith(
                        color: KwangColor.grey600,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: KwangColor.grey600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LastProductItem extends StatelessWidget {
  final Menu menu;

  const _LastProductItem({
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
