import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/screen_size.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/set_new_password_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetNewPasswordController());

    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: context.h(40)),
                    // const Center(child: AuthTripNestWordmark()),
                    SizedBox(height: context.h(40)),
                    Center(
                      child: AppText(
                        data: 'Set a new password',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF101828),
                      ),
                    ),
                    SizedBox(height: context.h(12)),
                    Center(
                      child: AppText(
                        data:
                            'Create a new password. Ensure it differs from previous ones for security',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF475467),
                      ),
                    ),
                    SizedBox(height: context.h(40)),
                    AppText(
                      data: 'New Password',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101828),
                    ),
                    SizedBox(height: context.h(8)),
                    AppTextField(
                      controller: controller.newPasswordController,
                      hintText: '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
                      obscureText: controller.obscureNew.value,
                      suffixWidget: IconButton(
                        onPressed: controller.toggleNew,
                        icon: Icon(
                          controller.obscureNew.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Color(0xFF475467),
                        ),
                      ),
                    ),
                    SizedBox(height: context.h(24)),
                    AppText(
                      data: 'Confirm Password',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101828),
                    ),
                    SizedBox(height: context.h(8)),
                    AppTextField(
                      controller: controller.confirmPasswordController,
                      hintText: '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
                      obscureText: controller.obscureConfirm.value,
                      suffixWidget: IconButton(
                        onPressed: controller.toggleConfirm,
                        icon: Icon(
                          controller.obscureConfirm.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Color(0xFF475467),
                        ),
                      ),
                    ),
                    SizedBox(height: context.h(32)),
                    AppButton(
                      buttonText: 'Reset Password',
                      onPressed: controller.onReset,
                      buttonHeight: context.h(54),
                    ),
                    SizedBox(height: context.h(40)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
