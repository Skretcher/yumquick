//signup_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:yumquick/utils/theme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          // 🟡 Header Section with yellow background and back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                color: AppColors.yellowDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.cardRadius),
                  bottomRight: Radius.circular(AppSizes.cardRadius),
                ),
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: GestureDetector(
                        onTap: () => context.go('/login'),
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: AppColors.error),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'New Account',
                        style: AppTextStyles.header,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ⚪ Form Card
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cardRadius),
                  topRight: Radius.circular(AppSizes.cardRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildInputField('Full name'),
                    const SizedBox(height: 16),
                    _buildInputField('Password', obscureText: true),
                    const SizedBox(height: 16),
                    _buildInputField('Email'),
                    const SizedBox(height: 16),
                    _buildInputField('Mobile Number'),
                    const SizedBox(height: 16),
                    _buildInputField('Date of birth'),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text.rich(
                        TextSpan(
                          text: 'By continuing, you agree to ',
                          style: AppTextStyles.subtitle,
                          children: [
                            TextSpan(
                              text: 'Terms of Use',
                              style: AppTextStyles.link,
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: AppTextStyles.link,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepOrange,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.buttonRadius),
                        ),
                      ),
                      child: const Text('Sign Up', style: AppTextStyles.button),
                    ),
                    const SizedBox(height: 12),
                    const Text('or sign up with', style: AppTextStyles.prompt),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint,
                            size: AppSizes.iconSize,
                            color: AppColors.deepOrange),
                        SizedBox(width: 16),
                        Icon(Icons.g_mobiledata,
                            size: AppSizes.iconSize,
                            color: AppColors.deepOrange),
                        SizedBox(width: 16),
                        Icon(Icons.apple,
                            size: 32, color: AppColors.deepOrange),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: AppTextStyles.prompt,
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: AppTextStyles.link,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.go('/login'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable input field for signup with theme integration
  Widget _buildInputField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightYellow,
        labelText: label,
        labelStyle: AppTextStyles.subtitle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
