import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class KeywordRankRow extends StatelessWidget {
  const KeywordRankRow(
      {super.key,
      required this.rank,
      required this.keyword,
      required this.rankColor});
  final int rank;
  final String keyword;
  final Color rankColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          alignment: Alignment.center,
          child: Text(
            rank.toString(),
            style: KwangStyle.header2.copyWith(color: rankColor),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          keyword,
          style: KwangStyle.body1M,
        )
      ],
    );
  }
}
