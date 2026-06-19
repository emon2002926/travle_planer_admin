import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/profile_controller.dart';


class PasswordChangeDialog extends StatelessWidget {
  const PasswordChangeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProfileController>();

    return Dialog(
      backgroundColor: Color(0x00000000),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Container(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _closeButton(),
                  const SizedBox(height: 4),
                  Center(
                    child: AppText(
                      data: 'Password Change',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 28),
                  _row(
                    label: 'Old Password',
                    input: Obx(
                      () => AppTextField(
                        controller: c.oldPass,
                        hintText: 'Enter old password',
                        obscureText: c.obscureOld.value,
                        fillColor: Colors.transparent,
                        inputTextColor: Color(0xFF101828),
                        suffixWidget: _eye(c.obscureOld.value, c.toggleOld),
                      ),
                    ),
                  ),
                  _row(
                    label: 'New Password',
                    input: Obx(
                      () => AppTextField(
                        controller: c.newPass,
                        hintText: 'Enter new password',
                        obscureText: c.obscureNew.value,
                        fillColor: Colors.transparent,
                        inputTextColor: Color(0xFF101828),
                        suffixWidget: _eye(c.obscureNew.value, c.toggleNew),
                      ),
                    ),
                  ),
                  _row(
                    label: 'Re Type New Password',
                    input: Obx(
                      () => AppTextField(
                        controller: c.retypePass,
                        hintText: 'Re-type new password',
                        obscureText: c.obscureRetype.value,
                        fillColor: Colors.transparent,
                        inputTextColor: Color(0xFF101828),
                        suffixWidget:
                            _eye(c.obscureRetype.value, c.toggleRetype),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: _outlinedButton(
                            text: 'Cancel', onTap: () => Get.back()),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _filledButton(
                            text: 'Update', onTap: c.updatePassword),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _eye(bool obscured, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: Color(0xFF475467),
      ),
    );
  }

  Widget _closeButton() {
    return Align(
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
          child: Icon(Icons.close, color: Color(0xFFFFFFFF), size: 20),
        ),
      ),
    );
  }

  Widget _row({
    required String label,
    required Widget input,
    Color labelColor = const Color(0xFF101828),
  }) {
    final labelWidget = AppText(
      data: label,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: labelColor,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 460) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [labelWidget, const SizedBox(height: 8), input],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 220, child: labelWidget),
              const SizedBox(width: 16),
              Expanded(child: input),
            ],
          );
        },
      ),
    );
  }

  Widget _outlinedButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 58,
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

  Widget _filledButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 58,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF1A56DB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          data: text,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
