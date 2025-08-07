import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:yumquick/utils/theme.dart';
import '../services/auth_service.dart';
import '../models/user.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _handleSignup() async {
    setState(() => _isLoading = true);

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final mobile = mobileController.text.trim();
    final dob = dobController.text.trim();

    final User? user = await _authService.signup(
      name: name,
      email: email,
      password: password,
      mobile: mobile,
      dob: dob,
    );

    setState(() => _isLoading = false);

    if (user != null) {
      if (mounted) context.go('/login');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup failed. Email may already be registered.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          // Header
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

          // Form
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
                    _buildInputField('Full name', controller: nameController),
                    const SizedBox(height: 16),
                    _buildInputField('Password',
                        controller: passwordController, obscureText: true),
                    const SizedBox(height: 16),
                    _buildInputField('Email', controller: emailController),
                    const SizedBox(height: 16),
                    _buildInputField('Mobile Number',
                        controller: mobileController), // ✅ Added controller
                    const SizedBox(height: 16),
                    _buildInputField('Date of birth',
                        controller: dobController), // ✅ Added controller
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
                      onPressed: _isLoading ? null : _handleSignup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepOrange,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.buttonRadius),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Sign Up', style: AppTextStyles.button),
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

  Widget _buildInputField(String label,
      {TextEditingController? controller, bool obscureText = false}) {
    return TextField(
      controller: controller,
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
