import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD55F),
      body: Stack(
        children: [
          // 🟡 Yellow Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD55F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
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
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'New Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ⚪ Signup Form
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
                          style: TextStyle(fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
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
                        backgroundColor: Colors.deepOrange,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Sign Up',
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                    const SizedBox(height: 12),
                    const Text('or sign up with'),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint,
                            size: 36, color: Colors.deepOrange),
                        SizedBox(width: 16),
                        Icon(Icons.g_mobiledata,
                            size: 36, color: Colors.deepOrange),
                        SizedBox(width: 16),
                        Icon(Icons.apple, size: 32, color: Colors.deepOrange),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: const TextStyle(color: Colors.deepOrange),
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

  Widget _buildInputField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFECB3),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
