import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/purchase_info/purchase_info_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class PurchaseInfoProgressWidget extends StatelessWidget {
  const PurchaseInfoProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PurchaseInfoViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Text(
            viewModel.phase.phaseTitle,
            style: KwangStyle.header2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width - 40, 40),
            painter: _ProgressBarPainter(
              width: MediaQuery.sizeOf(context).width - 40,
              height: 40,
              currentPhase: viewModel.phase,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double width;
  final double height;
  final EPurchaseInfoPhase currentPhase;

  late final List<TextSpan> phaseTextSpan;

  _ProgressBarPainter({
    required this.width,
    required this.height,
    required this.currentPhase,
  }) {
    var isPassed = true;
    List<TextSpan> textSpan = [];
    for (var phase in EPurchaseInfoPhase.values) {
      textSpan.add(
        TextSpan(
          text: phase.progressText,
          style: KwangStyle.btn1SB.copyWith(
            fontSize: 12,
            color: isPassed ? KwangColor.grey900 : KwangColor.grey600,
          ),
        ),
      );
      if (phase == currentPhase) {
        isPassed = false;
      }
    }
    phaseTextSpan = textSpan;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final phaseIdx = EPurchaseInfoPhase.values.indexOf(currentPhase);
    final diffX = (width / (phaseTextSpan.length - 1));

    // Paint base bar
    var baseBarPaint = Paint()
      ..color = KwangColor.primary50
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;
    var sOffset = const Offset(6, 6);
    var eOffset = Offset(width - 6, 6);
    canvas.drawLine(sOffset, eOffset, baseBarPaint);

    // Paint progress bar
    var progressBarPaint = Paint()
      ..color = KwangColor.primary200
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;
    sOffset = const Offset(6, 6);
    if (phaseIdx == phaseTextSpan.length - 1) {
      eOffset = Offset(width - 6, 6);
    } else {
      var textPainter = TextPainter()
        ..text = phaseTextSpan[phaseIdx]
        ..textDirection = TextDirection.ltr
        ..layout();
      eOffset = Offset(
        phaseIdx * diffX -
            textPainter.width * (phaseIdx / (phaseTextSpan.length - 1)) +
            textPainter.width / 2,
        6,
      );
    }

    canvas.drawLine(sOffset, eOffset, progressBarPaint);

    var isPassed = true;
    for (int phase = 0; phase < phaseTextSpan.length; phase++) {
      // Paint text
      var textPainter = TextPainter()
        ..text = phaseTextSpan[phase]
        ..textDirection = TextDirection.ltr
        ..textAlign = TextAlign.center
        ..layout();
      var xCenter = phase * diffX -
          textPainter.width * (phase / (phaseTextSpan.length - 1));
      var yCenter = height - textPainter.height;
      var offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);

      // Paint dot
      if (isPassed) {
        var dotPaint = Paint()
          ..color = KwangColor.primary300
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke;
        var dotOffset = Offset(offset.dx + textPainter.width / 2, 6);
        canvas.drawCircle(dotOffset, 0, dotPaint);
      } else {
        var dotPaint = Paint()
          ..color = KwangColor.primary100
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke;
        var dotOffset = Offset(offset.dx + textPainter.width / 2, 6);
        canvas.drawCircle(dotOffset, 0, dotPaint);

        dotPaint
          ..color = KwangColor.primary200
          ..strokeWidth = 6;
        canvas.drawCircle(dotOffset, 0, dotPaint);
      }

      if (phase == phaseIdx) {
        isPassed = false;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
