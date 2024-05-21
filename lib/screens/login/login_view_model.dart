import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  bool _isLoginBtnEnable = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool get isLoginBtnEnable => _isLoginBtnEnable;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  LoginViewModel() {
    initListeners();
  }

  void initListeners() {
    _emailController.addListener(() => checkEnableLoginBtn());
    _passwordController.addListener(() => checkEnableLoginBtn());
  }

  void checkEnableLoginBtn() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _isLoginBtnEnable = true;
    } else {
      _isLoginBtnEnable = false;
    }
    notifyListeners();
  }

  void login() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      print("[PRINT] 로그인 성공");
    } else {
      print("[PRINT] 로그인 실패");
    }
  }
}
