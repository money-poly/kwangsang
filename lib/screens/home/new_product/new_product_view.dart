import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:immersion_kwangsang/enums/loading_status.dart';
import 'package:immersion_kwangsang/screens/home/new_product/new_product_view_model.dart';
import 'package:immersion_kwangsang/screens/home/new_product/widgets/sale_store_card.dart';
import 'package:immersion_kwangsang/screens/home/new_product/widgets/sale_time_header.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/card_h_spliter.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NewProductView extends StatefulWidget {
  const NewProductView({super.key});

  @override
  State<NewProductView> createState() => _NewProductViewState();
}

class _NewProductViewState extends State<NewProductView>
    with AutomaticKeepAliveClientMixin {
  void _getData() {
    var viewModel = context.read<NewProductViewModel>();
    viewModel.getNewProducts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final viewModel = context.watch<NewProductViewModel>();

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (viewModel.status == ELoadingStatus.done) {
            return _scrollBody(viewModel);
          }
          if (viewModel.status == ELoadingStatus.error) {
            return Center(
              child: _errorBody(
                message: viewModel.errorMessage!,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: KwangColor.primary400,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _scrollBody(NewProductViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 28,
              top: 20,
              bottom: 6,
            ),
            child: Text(
              '곧 마감세일이 시작됩니다',
              style: KwangStyle.header2,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          sliver: MultiSliver(
            children: [
              for (var time in viewModel.newProducts)
                SliverStickyHeader(
                  header: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: SaleTimeHeader(
                      saleTime: time.saleTime,
                      storeCounts: time.stores.length,
                    ),
                  ),
                  sliver: SliverList.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: SaleStoreCard(
                          saleTime: time.saleTime,
                          storeItem: time.stores[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: CardHSpliter(
                        size: 1,
                        color: KwangColor.grey350,
                      ),
                    ),
                    itemCount: time.stores.length,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // TODO: refector to ListErrorWidget
  Widget _errorBody({
    required String message,
    bool isEmpty = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/imgs/img_86_bird_exclamation.png",
          width: 86,
          height: 86,
        ),
        if (isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "판매 중인 상품이 없어요",
              style: KwangStyle.header2,
            ),
          ),
        Text(
          message.replaceAll('Exception: ', ''),
          style: KwangStyle.body1M.copyWith(
            color: KwangColor.grey600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _getData,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: KwangColor.primary400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '재시도',
              style: KwangStyle.btn2B.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
