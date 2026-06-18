import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/screen_size.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/forget_password_controller.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

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
                      data: 'Forget Password?',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  SizedBox(height: context.h(12)),
                  Center(
                    child: AppText(
                      data: 'Please enter your email to get verification code',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF475467),
                    ),
                  ),
                  SizedBox(height: context.h(40)),
                  AppText(
                    data: 'Email address',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF101828),
                  ),
                  SizedBox(height: context.h(8)),
                  AppTextField(
                    controller: controller.emailController,
                    hintText: 'esteban_schiller@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: context.h(32)),
                  AppButton(
                    buttonText: 'Continue',
                    onPressed: controller.onContinue,
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
  }
}
