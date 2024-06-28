import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/navigation/onboarding_view_model.dart';
import 'package:immersion_kwangsang/services/amplitude.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnBoardingViewModel>(context);
    final analytics = AnalyticsConfig();
    List titles = ["마감할인도 놓치지 말고", "내 손에서 시작하는 경제적인 소비", "점주와 학생이 공생하는"];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 6,
            children: List.generate(
              3,
              (idx) => Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: viewModel.currIdx == idx
                      ? KwangColor.primary400
                      : KwangColor.grey500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              onPageChanged: (idx, reason) {
                viewModel.setCurrentPage(idx);
              },
            ),
            items: List.generate(
              3,
              (idx) => SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${titles[idx]}",
                      style:
                          KwangStyle.btn1SB.copyWith(color: KwangColor.grey700),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 80,
                      child: SvgPicture.asset(
                        "assets/icons/ic_265_onboarding_${idx + 1}.svg",
                        width: 265,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Image.asset("assets/imgs/img_346_onboarding_${idx + 1}.png",
                        width: 346)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 110),
        ],
      ),
      bottomSheet: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // GestureDetector(
          //   onTap: () async {
          //     await SharedPreferences.getInstance().then((value) {
          //       value.setBool("visited", true);
          //       Navigator.of(context).pushAndRemoveUntil(
          //         MaterialPageRoute(
          //             builder: (context) => const MyApp(isVisited: true)),
          //         (route) => false,
          //       );
          //     });
          //   },
          //   child: Container(
          //     alignment: Alignment.center,
          //     margin: const EdgeInsets.only(bottom: 4),
          //     height: 44,
          //     width: MediaQuery.of(context).size.width,
          //     child: Text("건너뛰기",
          //         style: KwangStyle.btn1SB.copyWith(color: KwangColor.grey600)),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.fromLTRB(
                20, 11, 20, 11 + MediaQuery.of(context).viewPadding.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: KwangColor.grey300),
              ),
            ),
            child: GestureDetector(
              onTap: () async {
                await SharedPreferences.getInstance().then((value) {
                  value.setBool("visited", true);
                  analytics.changePage("온보딩", "홈");
                  context.go("/nav");
                });
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: KwangColor.primary400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("시작하기",
                    style: KwangStyle.btn2B.copyWith(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
