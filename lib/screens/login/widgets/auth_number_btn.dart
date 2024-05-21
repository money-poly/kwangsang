import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_btn.dart';
import 'package:immersion_kwangsang/widgets/custom_textfield.dart';

enum AuthNumberBtnType {
  before,
  wait,
  after,
}

class AuthNumberBtn extends StatelessWidget {
  const AuthNumberBtn({super.key, required this.status, required this.enable});

  final AuthNumberBtnType status;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AuthNumberBtnType.before:
        return GestureDetector(
          onTap: () {}, // [TODO] 인증 문자 로직 구현
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: enable ? KwangColor.primary400 : KwangColor.grey300,
            ),
            child: Text(
              "인증문자 받기",
              style: KwangStyle.btn2B.copyWith(
                color: enable ? KwangColor.grey100 : KwangColor.grey600,
              ),
            ),
          ),
        );
      case AuthNumberBtnType.wait:
        return Column(
          children: [
            Stack(
              children: [
                CustomTextField(
                  controller: TextEditingController(), // [TODO] controller 변경
                  hintText: "인증번호 입력",
                  validator: (input) {
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {}, // [TODO] 인증번호 재전송 로직
                    child: Text("3:00",
                        style: KwangStyle.body1
                            .copyWith(color: KwangColor.grey700)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CustomBtn(
              txt: "인증 하기",
              bgColor: KwangColor.primary400,
              txtColor: KwangColor.grey100,
              unableBgColor: KwangColor.grey300,
              unableTxtColor: KwangColor.grey600,
              onTap: () {}, // [TODO] 인증하기 로직
              isEnable: true,
              type: CustomBtnType.small,
            ),
          ],
        );
      case AuthNumberBtnType.after:
        return CustomBtn(
          txt: "인증 완료",
          txtColor: KwangColor.primary400,
          bgColor: KwangColor.primary200,
          unableBgColor: KwangColor.primary400,
          unableTxtColor: KwangColor.primary200,
          onTap: () {},
          isEnable: true,
          type: CustomBtnType.small,
        );
    }
  }
}
