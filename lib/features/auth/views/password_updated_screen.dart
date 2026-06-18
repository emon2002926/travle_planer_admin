import 'package:flutter/material.dart';

import '../../../core/util/app_navigation.dart';
import '../../../core/util/screen_size.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/text/app_text.dart';
import 'login_screen.dart';

class PasswordUpdatedScreen extends StatelessWidget {
  const PasswordUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      data: 'Password Updated Successfully!',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  SizedBox(height: context.h(12)),
                  Center(
                    child: AppText(
                      data:
                          'Your new password has been saved. You can now continue securely.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF475467),
                    ),
                  ),
                  SizedBox(height: context.h(32)),
                  AppButton(
                    buttonText: 'Sign in',
                    onPressed: () => AppNavigation.push(LoginScreen()),
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
