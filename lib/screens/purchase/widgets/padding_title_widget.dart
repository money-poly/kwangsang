import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

class PaddingTitelWidget extends StatelessWidget {
  const PaddingTitelWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        title,
        style: KwangStyle.header2,
      ),
    );
  }
}
