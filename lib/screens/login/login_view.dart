import 'package:flutter/material.dart';
import 'package:immersion_kwangsang/screens/login/login_view_model.dart';
import 'package:immersion_kwangsang/screens/login/non_member_view.dart';
import 'package:immersion_kwangsang/styles/color.dart';
import 'package:immersion_kwangsang/styles/txt.dart';
import 'package:immersion_kwangsang/widgets/custom_btn.dart';
import 'package:immersion_kwangsang/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/imgs/img_104_logo_appbar.png",
          width: 104,
          height: 46,
        ),
        toolbarHeight: 58,
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: viewModel.formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                58 -
                MediaQuery.of(context).viewPadding.top -
                MediaQuery.of(context).viewPadding.bottom,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "마감할인 혜텍,\n광생에서 받아가세요!",
                        style: KwangStyle.header0,
                      ),
                      const SizedBox(height: 34),
                      CustomTextField(
                        controller: viewModel.emailController,
                        hintText: "이메일을 입력해주세요",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "이메일을 입력해주세요";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "올바른 이메일 형식을 입력해주세요";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: viewModel.passwordController,
                        hintText: "비밀번호를 입력해주세요",
                        validator: (value) {
                          if (value.isEmpty) {
                            return "비밀번호를 입력해주세요";
                          } else {
                            return null;
                          }
                        },
                        isObsecure: true,
                      ),
                      const SizedBox(height: 20),
                      CustomBtn(
                        txt: "로그인",
                        bgColor: KwangColor.primary400,
                        txtColor: KwangColor.grey100,
                        unableBgColor: KwangColor.grey400,
                        unableTxtColor: KwangColor.grey600,
                        onTap: () => viewModel.login(),
                        isEnable: viewModel.isLoginBtnEnable,
                        type: CustomBtnType.small,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: KwangColor.grey400,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  "간편 로그인",
                                  style: KwangStyle.body1
                                      .copyWith(color: KwangColor.grey700),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: KwangColor.grey400,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: KwangColor.grey100,
                                border: Border.all(
                                  color: KwangColor.grey400,
                                  width: 1,
                                )),
                            child: Image.asset(
                              "assets/imgs/img_20_platform_google.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Container(
                            width: 54,
                            height: 54,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: KwangColor.grey900,
                            ),
                            child: Image.asset(
                              "assets/imgs/img_20_platform_apple.png",
                              width: 20,
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              "아이디 찾기",
                              style: KwangStyle.body1
                                  .copyWith(color: KwangColor.grey700),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: KwangColor.grey400,
                          thickness: 1,
                          indent: 3,
                          endIndent: 3,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              "비밀번호 찾기",
                              style: KwangStyle.body1
                                  .copyWith(color: KwangColor.grey700),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: KwangColor.grey400,
                          thickness: 1,
                          indent: 3,
                          endIndent: 3,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              "회원가입",
                              style: KwangStyle.body1
                                  .copyWith(color: KwangColor.grey700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "회원가입이 어렵다면?",
                        style: KwangStyle.paragraph.copyWith(
                          color: KwangColor.grey600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NonMemberView(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "비회원 주문하기",
                            style: KwangStyle.paragraph.copyWith(
                              color: KwangColor.grey700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
