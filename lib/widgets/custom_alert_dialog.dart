import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';

enum AlertType {
  developing,
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.type});

  final AlertType type;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AlertType.developing:
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          titlePadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Center(
              child: Text("아직 준비중이에요!", style: KwangStyle.header1),
            ),
          ),
          actionsPadding: EdgeInsets.zero,
          actions: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                margin: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width - 64,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: KwangColor.primary400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("확인",
                    style:
                        KwangStyle.btn2B.copyWith(color: KwangColor.grey100)),
              ),
            )
          ],
          backgroundColor: KwangColor.grey100,
        );
    }
  }
}
