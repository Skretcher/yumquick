import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722), // 🔶 Deep orange background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // 🍽️ YumQuick Logo
            Image.asset(
              'assets/icons/Group271.png',
              width: 204,
              height: 257,
            ),

            const SizedBox(height: 10),

            // 📜 Description Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 40),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(246, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),

            // const Spacer(),

            // 🟡 Login & Signup Buttons - LIFTED UP using bottom padding
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  20, 0, 20, 130), // ⬅️⬆️⬇️ Adjust bottom padding here
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD54F), // Yellow
                      foregroundColor: Colors.deepOrange,
                      minimumSize: const Size(207, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  ElevatedButton(
                    onPressed: () => context.go('/signup'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 252, 228, 152),
                      foregroundColor: Colors.deepOrange,
                      minimumSize: const Size(207, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            // ⬇️ Optional: reduce this to bring buttons closer to bottom
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
