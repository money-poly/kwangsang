import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
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
          const SliverFillViewport(
            delegate: SliverChildListDelegate.fixed(
              [
                Center(
                  child: Text('RecommendView'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
