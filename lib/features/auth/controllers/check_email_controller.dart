import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_router.dart';

class CheckEmailController extends GetxController {
  final List<TextEditingController> otpControllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  // Wire this to AppTextField's onChanged if it exposes one, for auto-advance.
  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String get code => otpControllers.map((c) => c.text).join();

  void onVerify() {
    if (code.length < 5) return;
    // TODO: verify the code with your API, then:
    appRouter.go(AppRoutes.resetPassword);
  }

  void onResend() {
    // TODO: re-trigger the verification email.
  }

  @override
  void onClose() {
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
