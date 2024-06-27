import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/recommend/widgets/item_ranking_row.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_card.dart';
import 'package:immersion_kwangsang/screens/home/recommend/widgets/item_category.dart';
import 'package:immersion_kwangsang/screens/home/widgets/count_and_sort_title.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_more_btn.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/utils/number_formatter.dart';
import 'package:immersion_kwangsang/widgets/carousel_indicator.dart';
import 'package:provider/provider.dart';

class RecommendView extends StatelessWidget {
  const RecommendView({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = Menu(
      id: 1,
      name: "고구마 휘낭시에",
      imgUrl: null,
      discountRate: 50,
      discountPrice: 1000,
    );
    final menuWithImg = Menu(
      id: 1,
      name: "고구마 휘낭시에",
      imgUrl:
          "https://image.idus.com/image/files/8a8f31577e754c079c372824a103b2a9_512.jpg",
      discountRate: 50,
      discountPrice: 1000,
    );
    final viewModel = Provider.of<HomeViewModel>(context);
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        key: const PageStorageKey(EHomeTab.recommend),
        child: Column(
          children: [
            Container(
              color: KwangColor.grey300,
              padding: const EdgeInsets.only(top: 20, bottom: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: Text(
                      "오늘의 추천 상품이에요",
                      style: KwangStyle.header1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CarouselSlider.builder(
                    carouselController: viewModel.carouselController,
                    itemCount: 5,
                    itemBuilder: (context, idx, pageIdx) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 8),
                        child: ItemCard(
                            type: ItemCardType.bigSquare, menu: menuWithImg)),
                    options: CarouselOptions(
                      height: sWidth + 5,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) =>
                          viewModel.changeRecommendCurridx(index),
                    ),
                  ),
                  const SizedBox(height: 18),
                  CarouselIndicator(
                    controller: viewModel.carouselController,
                    currIdx: viewModel.recommendCurrIdx,
                    length: 5,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              color: KwangColor.grey100,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 20,
                      childAspectRatio:
                          ((sWidth - 100) / 4) / (((sWidth - 100) / 4) + 25),
                    ),
                    itemBuilder: (context, idx) => ItemCategoryCol(
                      category: ItemCategory.values[idx],
                    ),
                    itemCount: ItemCategory.values.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26),
                    child: ItemRankingRow(rank: 1, menu: menu),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: KwangColor.grey500,
                    ),
                    height: 76,
                    child: Text(
                      "이벤트 배너",
                      style: KwangStyle.header2.copyWith(
                        color: KwangColor.grey100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 148,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF3D5D47), Color(0xFF8AAD67)],
                              begin: Alignment(-0.5, -0.5),
                              end: Alignment(1, 1))),
                    ),
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/imgs/img_210_bird_bg.png",
                        width: 210,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 35,
                      child: SizedBox(
                        width: sWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "만원 이하로 한 끼 해결? 광생에선 가능!",
                              style: KwangStyle.header1.copyWith(
                                color: KwangColor.grey100,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "원하시는 금액대로 드래그해주세요",
                              style: KwangStyle.btn2SB.copyWith(
                                color: KwangColor.grey100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: sWidth,
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            color: KwangColor.grey100),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("오늘 사용할 식비는", style: KwangStyle.body1M),
                      Text(
                        commaNumberFormatter(5000),
                        style: KwangStyle.header0,
                      ),
                      const SizedBox(height: 12),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 8,
                          thumbColor: KwangColor.grey100,
                          activeTickMarkColor: Colors.transparent,
                          inactiveTickMarkColor: Colors.transparent,
                          activeTrackColor: KwangColor.primary400,
                          inactiveTrackColor: KwangColor.grey400,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius:
                                  14), // [TODO] 커스텀 슬라이더 thumb 적용
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 14),
                        ),
                        child: Slider(
                          value: 5000,
                          onChanged: (value) {}, // [TODO] Slide 로직
                          min: 1000,
                          max: 10000,
                          divisions: 9,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1천원",
                              style: KwangStyle.body2
                                  .copyWith(color: KwangColor.grey700)),
                          Text("1만원",
                              style: KwangStyle.body2
                                  .copyWith(color: KwangColor.grey700)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 26, bottom: 8),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: KwangColor.grey350,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CountAndSortTitle(
                            title: "${commaNumberFormatter(5000)} 이하 상품이에요",
                            count: 9,
                            sort: "거리순",
                            onTap: () {}),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 26,
                            childAspectRatio: ((sWidth - 48) / 3) /
                                (90 + ((sWidth - 48) / 3))),
                        itemCount: 6,
                        itemBuilder: (context, index) => ItemCard(
                            type: ItemCardType.miniSelling, menu: menuWithImg),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 16, bottom: 26),
                          child: ItemMoreBtn(onTap: () {}))
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Divider(
                    height: 4,
                    thickness: 4,
                    color: KwangColor.grey200,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: CountAndSortTitle(
                    title: "전체 세일 상품이에요",
                    count: 159,
                    sort: "거리순",
                    onTap: () {},
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 26,
                    crossAxisSpacing: 4,
                    childAspectRatio:
                        ((sWidth - 44) / 2) / (((sWidth - 44) / 2) + 90),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  itemBuilder: (context, idx) => ItemCard(
                    type: ItemCardType.vertical,
                    menu: menuWithImg,
                  ),
                  itemCount: 6,
                )
              ],
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
