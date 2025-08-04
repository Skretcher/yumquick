import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/utils/theme.dart';
import 'package:yumquick/utils/bottomnav.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0;
  int _currentIndex = 0;

  final List<String> tabs = ['Active', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          // 🟡 Top Header Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: AppColors.yellowDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.cardRadius),
                  bottomRight: Radius.circular(AppSizes.cardRadius),
                ),
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Row(
                children: [
                  // 🔙 Back button to return to previous screen
                  GestureDetector(
                    onTap: () {
                      // 🔁 Back navigation — change to go('/home') if needed
                      context.go("/home");
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: AppColors.error),
                  ),
                  const Spacer(),
                  const Text('My Orders', style: AppTextStyles.header),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),

          // ⚪ Card: Tabs + Content
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cardRadius),
                  topRight: Radius.circular(AppSizes.cardRadius),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // 🧭 Tabs for Order Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = _selectedTab == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTab = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.orange
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.deepOrange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),

                  // 📦 Order List or Empty State
                  Expanded(
                    child: _selectedTab == 0
                        ? _buildActiveOrders()
                        : _buildEmptyState(),
                  ),
                ],
              ),
            ),
          ),

          // 🔻 Bottom Navigation Bar
          BottomNav(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);

              // 🧭 Add route navigation based on index
              switch (index) {
                case 0:
                  context.go('/home');
                  break;
                case 1:
                  context.go('/search');
                  break;
                case 2:
                  context.go('/cart');
                  break;
                case 3:
                  context.go('/favorites');
                  break;
                case 4:
                  context.go('/profile');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  /// 🛑 Empty state for Completed/Cancelled tabs
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "You don't have any orders to cancel at this time",
            style: TextStyle(
              color: AppColors.deepOrange,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// 🟠 Sample active order list
  Widget _buildActiveOrders() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/shake.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Strawberry Shake',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '20 Nov, 04:20 pm\n2 items',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () => context.go('/cancel-order'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.deepOrange),
                          ),
                          child: const Text(
                            'Cancel Order',
                            style: TextStyle(color: AppColors.deepOrange),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.deepOrange,
                          ),
                          child: const Text('Track Driver'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                "\$20.00",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.deepOrange),
              ),
            ],
          ),
        )
      ],
    );
  }
}
