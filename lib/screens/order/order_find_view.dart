import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_textfield.dart';
import 'package:immersion_kwangsang/widgets/textfield_title.dart';

class OrderFindView extends StatelessWidget {
  const OrderFindView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KwangColor.grey100,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset("assets/icons/ic_36_back.svg"),
          ),
        ),
        leadingWidth: 52,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "비회원 주문 조회",
                  style: KwangStyle.header1,
                ),
                const SizedBox(height: 32),
                const TextFieldTitle(title: "주문번호"),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: "알림톡으로 받으신 주문번호를 입력해주세요",
                  validator: (value) {
                    return null;
                  },
                ), // [TODO] controller, validator 추가
                const SizedBox(height: 26),
                const TextFieldTitle(title: "휴대폰 번호"),
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: "휴대폰 번호를 입력해주세요",
                  validator: (value) {
                    return null;
                  },
                ), // [TODO] controller, validator 추가
                const SizedBox(height: 12),
                Container(
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: KwangColor.grey400),
                  child: Text(
                    "조회 하기",
                    style: KwangStyle.btn2B.copyWith(
                      color: KwangColor.grey600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
