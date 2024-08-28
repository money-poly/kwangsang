import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/models/menu/menu_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/limit_stock_view_model.dart';
import 'package:immersion_kwangsang/screens/home/limit_stock/widgets/last_item_widget.dart';
import 'package:immersion_kwangsang/screens/home/widgets/list_error_widget.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class LastProductsCard extends StatelessWidget {
  const LastProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LimitStockViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '마지막 찬스! 딱 한개 남았어요',
            style: KwangStyle.header2,
          ),
          const SizedBox(height: 16),
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        KwangColor.primary400,
                        KwangColor.primary250,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [
                      KwangColor.primary50,
                      KwangColor.grey100,
                      KwangColor.primary100,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Builder(builder: (context) {
                  if (viewModel.lastStatus == ELoadingStatus.error) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ListErrorWidget(
                          message: viewModel.lastErrorMessage!,
                          onTapRetry: () => viewModel.getLastItem(
                              getAll: viewModel.expandList),
                        ),
                      ),
                    );
                  }

                  if (viewModel.lastMenu.isEmpty) {
                    if (viewModel.lastStatus == ELoadingStatus.done) {
                      return SizedBox(
                        width: double.infinity,
                        child: ListErrorWidget(
                          isEmptyList: true,
                          message:
                              "현재 판매 중인 상품이 없습니다.\n새로운 상품을 준비 중이니, 잠시만 기다려주세요.",
                          onTapRetry: () => viewModel.getLastItem(
                              getAll: viewModel.expandList),
                        ),
                      );
                    }
                    return const SizedBox(
                      height: 160,
                      width: double.infinity,
                    );
                  }

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final menu = viewModel.lastMenu[index].menu;
                      final store = viewModel.lastMenu[index].store;
                      return LastItemWidget(
                        menu: Menu(
                          id: menu.id,
                          store: store.name,
                          name: menu.name,
                          imgUrl: menu.imgUrl,
                          discountRate: menu.discountRate,
                          discountPrice: menu.discountPrice,
                          regularPrice: menu.regularPrice,
                          count: menu.count,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: CardHSpliter(
                        size: 1,
                        color: KwangColor.grey500,
                      ),
                    ),
                    itemCount: viewModel.expandList
                        ? viewModel.lastMenu.length
                        : math.min(2, viewModel.lastMenu.length),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (viewModel.lastStatus == ELoadingStatus.loading)
            const Center(
              child: CircularProgressIndicator(
                color: KwangColor.primary400,
              ),
            )
          else if (viewModel.lastStatus == ELoadingStatus.loaded)
            Center(
              child: GestureDetector(
                onTap: viewModel.toggleExpendList,
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: KwangColor.grey400,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        viewModel.expandList ? '접기' : '상품 더 보기',
                        style: KwangStyle.btn3SB.copyWith(
                          color: KwangColor.grey600,
                        ),
                      ),
                      Icon(
                        viewModel.expandList
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: KwangColor.grey600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
