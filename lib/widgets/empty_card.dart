import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:url_launcher/url_launcher.dart';

enum EmptyCardType {
  home("할인중인 메뉴가 없어요!", "다른 카테고리를 선택해보세요"),
  search("검색결과가 없어요!", "다른 검색어로 다시 검색해주세요");

  const EmptyCardType(this.title, this.description);
  final String title;
  final String description;
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key, required this.emptyType});

  final EmptyCardType emptyType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Image.asset(
          "assets/imgs/img_86_bird_exclamation.png",
          width: 86,
          height: 86,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(children: [
            Text(
              emptyType.title,
              style: KwangStyle.header2,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              emptyType.description,
              style: KwangStyle.btn1SB.copyWith(color: KwangColor.grey600),
            ),
          ]),
        ),
        if (emptyType == EmptyCardType.search) const SizedBox(height: 12),
        if (emptyType == EmptyCardType.search)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              await launchUrl(Uri.parse("${dotenv.env['KAKAO_URL']}"));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: KwangColor.grey300),
              ),
              child: Text(
                "매장 등록요청",
                style: KwangStyle.btn2SB.copyWith(color: KwangColor.primary200),
              ),
            ),
          ),
        Flexible(
          flex: 2,
          child: Container(),
        )
      ]),
    );
  }
}
