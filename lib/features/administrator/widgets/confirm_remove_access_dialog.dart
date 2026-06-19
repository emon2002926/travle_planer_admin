import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/administrators_controller.dart';

class ConfirmRemoveAccessDialog extends StatelessWidget {
  final int index;
  const ConfirmRemoveAccessDialog({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdministratorsController>();

    return Dialog(
      backgroundColor: Color(0x00000000),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Container(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 40),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Get.back(),
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1C24),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close,
                          color: Color(0xFFFFFFFF), size: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: AppText(
                    data: 'Confirm Remove access',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: _outlinedButton(
                        text: 'Cancel',
                        onTap: () => Get.back(),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _filledButton(
                        text: 'Delete',
                        icon: Icons.delete_outline,
                        onTap: () => controller.deleteAdmin(index),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlinedButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Color(0xFF1A56DB)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          data: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A56DB),
        ),
      ),
    );
  }

  Widget _filledButton({
    required String text,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF1A56DB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Color(0xFFFFFFFF), size: 20),
              const SizedBox(width: 10),
            ],
            AppText(
              data: text,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
