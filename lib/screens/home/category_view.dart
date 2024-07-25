import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/constants/routes.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/home_view_model.dart';
import 'package:immersion_kwangsang/screens/home/recommend/widgets/item_category.dart';
import 'package:immersion_kwangsang/screens/home/widgets/count_and_sort_title.dart';
import 'package:immersion_kwangsang/screens/home/widgets/item_card.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';
import 'category_view_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuWithImg = Menu(
      id: 1,
      name: "고구마 휘낭시에",
      imgUrl:
          "https://image.idus.com/image/files/8a8f31577e754c079c372824a103b2a9_512.jpg",
      discountRate: 50,
      discountPrice: 1000,
    );

    final viewModel = Provider.of<CategoryViewModel>(context);
    final sWidth = MediaQuery.of(context).size.width;
    final isFranchise = viewModel.selectedCategory == ItemCategory.franchise;

    final List<Map<bool, double>> isFranchiseOption = [
      {true: 8, false: 4},
      {true: 16, false: 24},
      {
        true: 1.7,
        false: ((sWidth - 44) / 2) / (((sWidth - 44) / 2) + 90),
      }
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        toolbarHeight: 52,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/ic_36_back.svg",
              width: 36,
              height: 36,
            ),
          ),
        ),
        title: Text(
          viewModel.selectedCategory.str,
          style: KwangStyle.header2,
        ),
        actions: [
          GestureDetector(
            onTap: () => context.push(Routes.search),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                "assets/icons/ic_36_search.svg",
                width: 36,
                height: 36,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                height: 114,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: ItemCategory.values.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 80,
                    child: GestureDetector(
                      onTap: () =>
                          viewModel.selectCategory(ItemCategory.values[index]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: viewModel.selectedCategory ==
                                      ItemCategory.values[index]
                                  ? KwangColor.grey700
                                  : KwangColor.grey350, // [TODO] 선택시 색상변경
                            ),
                          ),
                          Text(ItemCategory.values[index].str,
                              style: KwangStyle.body2M),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: CountAndSortTitle(
                  title: isFranchise ? "프랜차이즈 전체" : "판매 중인 상품",
                  count: 36,
                  sort: Order.last,
                  onTap: () {},
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: isFranchiseOption[0][isFranchise]!,
                  mainAxisSpacing: isFranchiseOption[1][isFranchise]!,
                  childAspectRatio: isFranchiseOption[2][isFranchise]!,
                ),
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                    20, 8, 20, 28 + MediaQuery.of(context).padding.bottom),
                itemBuilder: (context, idx) => isFranchise
                    ? GestureDetector(
                        onTap: () {
                          context.push(Routes.franchise);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: KwangColor.grey400, width: 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CustomNetworkImage(
                                  width: (sWidth - 48) / 2,
                                  height: (sWidth - 48) / 5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text("파리바게트", style: KwangStyle.body1),
                          ],
                        ),
                      )
                    : ItemCard(
                        type: ItemCardType.vertical,
                        menu: menuWithImg,
                      ),
                itemCount: 6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
