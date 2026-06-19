import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_router.dart';

class SetNewPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool obscureNew = true.obs;
  final RxBool obscureConfirm = true.obs;

  void toggleNew() => obscureNew.value = !obscureNew.value;
  void toggleConfirm() => obscureConfirm.value = !obscureConfirm.value;

  void onReset() {
    final pass = newPasswordController.text;
    final confirm = confirmPasswordController.text;
    if (pass.isEmpty || confirm.isEmpty) return;
    if (pass != confirm) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }
    // TODO: send the new password to your API, then:
    appRouter.go(AppRoutes.resetSuccess);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
