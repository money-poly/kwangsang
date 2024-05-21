import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/widgets/menu_rank_card.dart';
import 'package:immersion_kwangsang/widgets/rounded_selectable_button.dart';
import 'package:provider/provider.dart';

class RecommendView extends StatelessWidget {
  const RecommendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // 스크롤 포지션을 유지하고 싶다면 스크롤뷰에 아래의 키 예제와 같이 추가해주세요.
        key: const PageStorageKey(EHomeTab.recommend),
        slivers: [
          SliverFillViewport(
            delegate: SliverChildListDelegate.fixed(
              [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var tab in EHomeTab.values)
                        GestureDetector(
                          // 뷰모델로 탭을 바꾸는 예제입니다.
                          onTap: () {
                            var viewModel = Provider.of<HomeViewModel>(
                              context,
                              listen: false,
                            );
                            viewModel.changeTab(tab);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: KwangColor.primary400,
                            ),
                            child: Center(
                              child: Text(
                                'Move tab to ${tab.tabTitle}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            title: Row(
              children: [
                const RoundedSelectableButton(
                  text: '전체',
                  isSelected: true,
                ),
                RoundedSelectableButton(
                  text: '한식',
                  onTap: () {
                    print('한식');
                  },
                ),
                const RoundedSelectableButton(text: '중식'),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                for (int i = 1; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: MenuRankCard(
                      menu: Menu(
                        id: i,
                        store: '파리바게트 광운대점',
                        name: 'Menu $i',
                        imgUrl: i % 2 == 0
                            ? 'https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR'
                            : null,
                        discountRate: 10,
                        discountPrice: 8900,
                        view: 2,
                      ),
                      rank: i,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
