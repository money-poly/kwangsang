import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: Center(
            child: Container(
              color: Colors.green,
              width: 140,
              height: 140,
            ),
          ),
        ),
        const Text("SNS 계정으로 간편하게 가입하기", style: TextStyle(fontSize: 14)),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 34),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 20,
            children: [
              socialBtn("google", Colors.grey[100]!, () {}),
              socialBtn("apple", Colors.black, () {}),
            ],
          ),
        ),
        Text(
          "로그인 관련 문의하기",
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.underline,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 60),
      ]),
    );
  }

  Widget socialBtn(String type, Color color, action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Image.asset(
          "assets/imgs/img_24_social_$type.png",
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
