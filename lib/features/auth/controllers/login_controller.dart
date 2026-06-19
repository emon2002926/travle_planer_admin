import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_router.dart';

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
    // TODO: call your auth API here, then on success:
    appRouter.go(AppRoutes.dashboard);
  }

  void onForgetPassword() {
    appRouter.go(AppRoutes.forgotPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
