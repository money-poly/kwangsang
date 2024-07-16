import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_network_image.dart';

class FranchiseCard extends StatelessWidget {
  const FranchiseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 212,
          width: MediaQuery.of(context).size.width - 40,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: KwangColor.grey400, width: 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: KwangColor.black.withOpacity(0.06),
                blurRadius: 4,
                offset: const Offset(0, 0),
              )
            ],
            color: KwangColor.grey100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const CustomNetworkImage(
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "파리바게트",
                            style: KwangStyle.body2M.copyWith(
                              color: KwangColor.grey600,
                            ),
                          ),
                          Text(
                            "랩오브 파리바게트 판교점",
                            style: KwangStyle.body1M,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 8),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: KwangColor.lightBlue, width: 1),
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: Text(
                      "356m",
                      style: KwangStyle.btn3SB.copyWith(
                        color: KwangColor.lightBlue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: CustomNetworkImage(
            imageUrl:
                "https://cdn.paris.spl.li/wp-content/uploads/2019/11/%E1%84%8F%E1%85%A1%E1%84%91%E1%85%A6%E1%84%8C%E1%85%A5%E1%86%AB%E1%84%80%E1%85%A7%E1%86%BC.jpg",
            width: MediaQuery.of(context).size.width - 40,
            height: 144,
          ),
        )
      ],
    );
  }
}
