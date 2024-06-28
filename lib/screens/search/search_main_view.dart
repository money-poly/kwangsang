import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:immersion_kwangsang/screens/search/search_main_view_model.dart';
import 'package:immersion_kwangsang/screens/search/widgets/search_after_tab.dart';
import 'package:immersion_kwangsang/screens/search/widgets/search_before_tab.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:provider/provider.dart';

class SearchMainView extends StatelessWidget {
  const SearchMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchMainViewModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "검색",
            style: KwangStyle.header2,
          ),
          titleSpacing: 0,
          toolbarHeight: 52,
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                if (viewModel.status == SearchStatus.after) {
                  viewModel.changeStatus(SearchStatus.before);
                } else {
                  context.pop();
                }
              },
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset(
                "assets/icons/ic_36_back.svg",
                width: 36,
                height: 36,
              ),
            ),
          ),
          leadingWidth: 52,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: switch (viewModel.status) {
          SearchStatus.before => const SearchBeforeTab(),
          SearchStatus.after => const SearchAfterTab(),
        });
  }
}
