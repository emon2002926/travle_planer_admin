import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              data: 'Update Your Api Key',
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF101828),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFEAF1FB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.apiKeyController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your api key here',
                        hintStyle: TextStyle(color: Color(0xFF98A2B3)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: controller.onSave,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A56DB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        data: 'Save',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
