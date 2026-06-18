import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final TextEditingController apiKeyController = TextEditingController();

  void onSave() {
    if (apiKeyController.text.trim().isEmpty) return;
    // TODO: persist the API key via your API.
  }

  @override
  void onClose() {
    apiKeyController.dispose();
    super.onClose();
  }
}
