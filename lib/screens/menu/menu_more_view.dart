import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet.dart';
import 'package:immersion_kwangsang/screens/menu/menu_bottom_sheet_view_model.dart';
import 'package:immersion_kwangsang/screens/menu/menu_more_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/countable_menu_card.dart';
import 'package:provider/provider.dart';

class MenuMoreView extends StatelessWidget {
  const MenuMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomSheetModel = context.read<MenuBottomSheetViewModel>();
    return Scaffold(
      backgroundColor: KwangColor.grey100,
      appBar: AppBar(
        title: Text("메뉴 전체보기", style: KwangStyle.header2),
        toolbarHeight: 52,
        titleSpacing: 8,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              "assets/icons/ic_36_back.svg",
              width: 36,
              height: 36,
            ),
          ),
        ),
        leadingWidth: 44,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
              bottom: 20,
              top: 6,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var option in EMenuMoreSortOption.values)
                  _sortOptionBtn(
                    option,
                    isSelected: option == EMenuMoreSortOption.favorite,
                    onTap: () {},
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: 110 + MediaQuery.paddingOf(context).bottom,
              ),
              itemBuilder: (context, index) {
                var menuMock = Menu(
                  id: 100 + index,
                  name: '메뉴 ${index + 1}',
                  imgUrl:
                      "https://lh4.googleusercontent.com/on7Yj1rShJRRBy88rTmptLVzMI4gEBDBabmSMv-GGsPIo5umfS5dpSJp3b4EoqKtnxdOYXeHSyct6m2fLYKckaikrUJn91PNWkIYXtkrCljcvdEnGdf_nQM5Qw6bQY4q6jvbWiBcC3WPTIcDS_lizv3R25oVAF_H0PNzvRo7JivPSiZR",
                  discountRate: 10,
                  regularPrice: 11000,
                  discountPrice: 10000,
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CountableMenuCard(
                    menu: menuMock,
                    type: CMenuCardType.large,
                    add: () {
                      bottomSheetModel.plusMenu(menuMock);
                    },
                    subtract: () {
                      bottomSheetModel.minusMenu(menuMock);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 1,
                color: KwangColor.grey350,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
      bottomSheet: const MenuBottomSheet(),
    );
  }

  Widget _sortOptionBtn(
    EMenuMoreSortOption option, {
    bool isSelected = false,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? KwangColor.primary400 : KwangColor.grey300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            option.text,
            style: KwangStyle.btn2B.copyWith(
              color: isSelected ? Colors.white : KwangColor.grey600,
            ),
          ),
        ),
      ),
    );
  }
}
