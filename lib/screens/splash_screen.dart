import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      context.go('/onboarding'); // navigate to login after splash
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFFCB4C), // yellow background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/Group270.png', // Make sure you have this image
              width: 204,
              height: 257,
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
