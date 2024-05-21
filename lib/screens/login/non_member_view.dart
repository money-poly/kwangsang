import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immersion_kwangsang/screens/login/widgets/auth_number_btn.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_btn.dart';
import 'package:immersion_kwangsang/widgets/custom_textfield.dart';
import 'package:immersion_kwangsang/widgets/textfield_title.dart';

class NonMemberView extends StatelessWidget {
  const NonMemberView({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "빠른 주문을 위해\n비회원 정보를 미리 기입해주세요",
                    style: KwangStyle.header1,
                  ),
                ),
                const TextFieldTitle(title: "성명", isNecessary: true),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: "성명을 입력해주세요",
                  validator: (value) {
                    return null;
                  },
                ), // [TODO] controller, validator 추가
                const SizedBox(height: 20),
                const TextFieldTitle(title: "휴대폰 번호", isNecessary: true),
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.phone,
                  hintText: "휴대폰 번호를 입력해주세요",
                  validator: (value) {
                    return null;
                  },
                ), // [TODO] controller, validator 추가
                const SizedBox(height: 12),
                const AuthNumberBtn(
                    status: AuthNumberBtnType.before, enable: false)
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CustomBtn(
        txt: "광생 시작하기",
        bgColor: KwangColor.primary400,
        txtColor: KwangColor.grey100,
        unableBgColor: KwangColor.grey400,
        unableTxtColor: KwangColor.grey600,
        onTap: () {},
        isEnable: false,
        type: CustomBtnType.big,
      ),
    );
  }
}
