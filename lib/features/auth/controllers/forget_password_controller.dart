import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/util/app_navigation.dart';
import '../views/check_email_screen.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  void onContinue() {
    if (emailController.text.trim().isEmpty) return;
    // TODO: call your "send verification code" API, then:
    AppNavigation.push(CheckEmailScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
