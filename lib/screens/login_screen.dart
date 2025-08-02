import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:yumquick/utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get headerText {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return (email.isNotEmpty && password.isNotEmpty) ? 'Hello !' : 'Log In';
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));

    print('LoginScreen loaded:');
    print('Email: Ark@arktini.com');
    print('Password: Ark123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: AppSizes.headerHeight,
              decoration: const BoxDecoration(
                color: AppColors.yellowDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.cardRadius),
                  bottomRight: Radius.circular(AppSizes.cardRadius),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 50, bottom: 0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: GestureDetector(
                        onTap: () => context.go('/welcome'),
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: AppColors.error),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        headerText,
                        style: AppTextStyles.header,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome', style: AppTextStyles.welcome),
                        SizedBox(height: 4),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                          style: AppTextStyles.subtitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildInputField(
                      label: 'Email or Mobile Number',
                      icon: Icons.email,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?',
                            style: AppTextStyles.link),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (email == 'Ark@arktini.com' &&
                            password == 'Ark123') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login successful!'),
                              backgroundColor: AppColors.success,
                            ),
                          );
                          context.go('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid credentials!'),
                              backgroundColor: AppColors.error,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepOrange,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.buttonRadius),
                        ),
                      ),
                      child: const Text('Log In', style: AppTextStyles.button),
                    ),
                    const SizedBox(height: 16),
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
                        text: "Don't have an account? ",
                        style: AppTextStyles.prompt,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: AppTextStyles.link,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.go('/signup'),
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

  /// Reusable input field builder with custom styling from theme.dart
  Widget _buildInputField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightYellow,
        labelText: label,
        labelStyle: AppTextStyles.subtitle,
        prefixIcon: Icon(icon, color: AppColors.deepOrange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
