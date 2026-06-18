import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/app_navigation.dart';
import '../views/dashboard_screen.dart';
import '../views/forget_password_screen.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool rememberPassword = true.obs;

  void togglePasswordVisibility() =>
      obscurePassword.value = !obscurePassword.value;

  void toggleRememberPassword() =>
      rememberPassword.value = !rememberPassword.value;

  void onSignIn() {
    // if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
    //   return;
    // }
    // TODO: call your auth API here, then on success navigate to the
    // admin dashboard, e.g.:
    AppNavigation.push(DashboardScreen());
  }

  void onForgetPassword() {
    AppNavigation.push(ForgetPasswordScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}