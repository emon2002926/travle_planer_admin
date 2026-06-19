import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/screen_size.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/login_controller.dart';


const Color _kBackground = Color(0xFFFFFFFF);
const Color _kPrimary = Color(0xFF1A56DB);
const Color _kTextPrimary = Color(0xFF101828);
const Color _kTextSecondary = Color(0xFF475467);

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Obx(() {
      return Scaffold(
        backgroundColor: _kBackground,
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
                        data: 'Login to Account',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: _kTextPrimary,
                      ),
                    ),
                    SizedBox(height: context.h(12)),
                    Center(
                      child: AppText(
                        data: 'Please enter your email and password to continue',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: _kTextSecondary,
                      ),
                    ),
                    SizedBox(height: context.h(40)),

                    // -- Email --------------------------------
                    AppText(
                      data: 'Email address',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _kTextPrimary,
                    ),
                    SizedBox(height: context.h(8)),
                    AppTextField(
                      controller: controller.emailController,
                      hintText: 'esteban_schiller@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: context.h(24)),

                    // -- Password -----------------------------
                    AppText(
                      data: 'Password',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _kTextPrimary,
                    ),
                    SizedBox(height: context.h(8)),
                    AppTextField(
                      controller: controller.passwordController,
                      hintText: '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
                      obscureText: controller.obscurePassword.value,
                      suffixWidget: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: _kTextSecondary,
                        ),
                      ),
                    ),
                    SizedBox(height: context.h(16)),

                    // -- Remember + Forget --------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: context.w(22),
                              height: context.w(22),
                              child: Checkbox(
                                value: controller.rememberPassword.value,
                                onChanged: (_) =>
                                    controller.toggleRememberPassword(),
                                activeColor: _kPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            SizedBox(width: context.w(10)),
                            AppText(
                              data: 'Remember Password',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: _kTextPrimary,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: controller.onForgetPassword,
                          child: AppText(
                            data: 'Forget Password?',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _kPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(32)),

                    AppButton(
                      buttonText: 'Sign in',
                      onPressed: controller.onSignIn,
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
