import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/navigation/nav_view_model.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_alert_dialog.dart';
import 'package:provider/provider.dart';

class NavView extends StatelessWidget {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavViewModel>(context);
    return Scaffold(
      body: viewModel.pages[viewModel.currIdx],
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        color: KwangColor.grey100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: NavItems.values
              .map(
                (item) => Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (item.index == 2) {
                        showDialog(
                          context: context,
                          builder: (_) => const CustomAlertDialog(
                              type: AlertType.developing),
                        );
                      } else {
                        viewModel.changeIdx(item.index);
                      }
                    },
                    child: Container(
                      height: 64,
                      padding: const EdgeInsets.only(bottom: 8, top: 13),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: KwangColor.grey300, width: 0.5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SvgPicture.asset(
                                "assets/icons/ic_24_${item.name}.svg",
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                    item.index == viewModel.currIdx
                                        ? KwangColor.primary400
                                        : KwangColor.grey500,
                                    BlendMode.srcIn)),
                          ),
                          Text(item.label,
                              style: KwangStyle.navigationLabel.copyWith(
                                  color: item.index == viewModel.currIdx
                                      ? KwangColor.primary400
                                      : KwangColor.grey500)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
