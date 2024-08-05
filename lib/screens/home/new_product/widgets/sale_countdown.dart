import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/extensions.dart';

class SaleCountDown extends StatefulWidget {
  final DateTime saleTime;
  const SaleCountDown({
    super.key,
    required this.saleTime,
  });

  @override
  State<SaleCountDown> createState() => _SaleCountDownState();
}

class _SaleCountDownState extends State<SaleCountDown>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  late String _countDownText;

  @override
  void initState() {
    super.initState();
    _countDownText = widget.saleTime.countDownHHMMSS();
    _ticker = createTicker(
      (elapsed) {
        var newCountDownText = widget.saleTime.countDownHHMMSS();
        if (newCountDownText != _countDownText) {
          setState(() {
            _countDownText = newCountDownText;
          });
        }
      },
    )..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _countDownText,
      style: KwangStyle.btn2SB.copyWith(
        color: KwangColor.red,
      ),
    );
  }
}
