import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/login/login_view.dart';
import 'package:immersion_kwangsang/screens/login/login_view_model.dart';
import 'package:immersion_kwangsang/screens/order/order_find_view.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class OrderIngView extends StatelessWidget {
  const OrderIngView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/imgs/img_86_bird_exclamation.png",
                width: 86,
                height: 86,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text("아직 주문 내역이 없어요", style: KwangStyle.header2),
                    const SizedBox(height: 8),
                    Text(
                      "광생에 로그인/회원가입하면, 주문 내역과\n진행 상황을 확인할 수 있습니다.",
                      style:
                          KwangStyle.body1M.copyWith(color: KwangColor.grey600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => LoginViewModel(),
                        child: const LoginView(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: KwangColor.grey400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "로그인/회원가입",
                    style: KwangStyle.btn2SB.copyWith(
                      color: KwangColor.primary300,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OrderFindView(),
              ),
            );
          },
          child: Text(
            "비회원 주문 조회",
            style: KwangStyle.btn2SB.copyWith(
              decoration: TextDecoration.underline,
              color: KwangColor.grey800,
            ),
          ),
        ),
        const SizedBox(height: 36)
      ],
    );
  }
}
