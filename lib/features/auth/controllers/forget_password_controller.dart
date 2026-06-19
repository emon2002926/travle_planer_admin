import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_router.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  void onContinue() {
    if (emailController.text.trim().isEmpty) return;
    // TODO: call your "send verification code" API, then:
    appRouter.go(AppRoutes.verify);
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
