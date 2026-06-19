import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/screen_size.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/check_email_controller.dart';


class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckEmailController());

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
                      data: 'Check your email',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  SizedBox(height: context.h(12)),
                  Center(
                    child: AppText(
                      data:
                          'We sent a code to your email address. Please check your email for the 5 digit code.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF475467),
                    ),
                  ),
                  SizedBox(height: context.h(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w(6)),
                        child: SizedBox(
                          width: context.w(60),
                          child: AppTextField(
                            controller: controller.otpControllers[index],
                            focusNode: controller.focusNodes[index],
                            hintText: '',
                            keyboardType: TextInputType.number,
                            isHintTextInMiddle: true,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: context.h(32)),
                  AppButton(
                    buttonText: 'Verify',
                    onPressed: controller.onVerify,
                    buttonHeight: context.h(54),
                  ),
                  SizedBox(height: context.h(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        data: 'You have not received the email? ',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF101828),
                      ),
                      GestureDetector(
                        onTap: controller.onResend,
                        child: AppText(
                          data: 'Resend',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A56DB),
                        ),
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
}
