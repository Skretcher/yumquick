import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/Rectangle145.png',
      'icon': Icons.lock_outline.codePoint.toString(),
      'title': 'Order For Food',
      'desc':
          'Lorem ipsum dolor sit amet, conse ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
    },
    {
      'image': 'assets/images/Rectangle146.png',
      'icon': Icons.payment.codePoint.toString(),
      'title': 'Easy Payment',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
    },
    {
      'image': 'assets/images/Rectangle147.png',
      'icon': Icons.local_shipping.codePoint.toString(),
      'title': 'Fast Delivery',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      context.go('/welcome'); // Navigate to welcome screen on last page
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, // 🟤 Avoid yellow or transparent leaks
      body: Stack(
        children: [
          // 🖼️ Background Full-Screen Image
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.black, // 🛑 Prevents visual leaks
                child: Image.asset(
                  onboardingData[index]['image']!,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),

          // 📄 Foreground Overlay
          Positioned.fill(
            child: Column(
              children: [
                // 🔘 Skip Button (top right)
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 16),
                      child: TextButton(
                        onPressed: () => context.go('/welcome'),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 14, color: Colors.orange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // 🧾 Bottom Content Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 30, 24,
                      70), // ⬆️ Increased bottom padding to lift button up
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(32)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 🧩 Icon
                      Icon(
                        IconData(
                          int.parse(onboardingData[_currentPage]['icon']!),
                          fontFamily: 'MaterialIcons',
                        ),
                        size: 50,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(height: 20),

                      // 🏷️ Title
                      Text(
                        onboardingData[_currentPage]['title']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 📖 Description
                      Text(
                        onboardingData[_currentPage]['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(221, 94, 51, 31),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ⭕ Dots Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == dotIndex ? 20 : 8,
                            height: 4,
                            decoration: BoxDecoration(
                              color: _currentPage == dotIndex
                                  ? Colors.deepOrange
                                  : Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // ▶️ Next Button
                      ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: const Size(150, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(46),
                          ),
                        ),
                        child: Text(
                          _currentPage == onboardingData.length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
