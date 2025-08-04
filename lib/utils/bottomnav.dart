// lib/widgets/bottomnav.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/utils/theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 25,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.deepOrange,
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(context, index: 0, icon: Icons.home_outlined),
            _navItem(context, index: 1, icon: Icons.dinner_dining_outlined),
            _navItem(context, index: 2, icon: Icons.favorite_border_outlined),
            _navItem(context, index: 3, icon: Icons.assignment_outlined),
            _navItem(context, index: 4, icon: Icons.support_agent_outlined),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required int index,
    IconData? icon,
    String? assetPath,
  }) {
    final isSelected = index == currentIndex;

    return IconButton(
      onPressed: () {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/menu');
            break;
          case 2:
            context.go('/favourites');
            break;
          case 3:
            context.go('/orders');
            break;
          case 4:
            context.go('/support');
            break;
        }
      },
      icon: assetPath != null
          ? Image.asset(
              assetPath,
              width: 26,
              height: 26,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            )
          : Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            ),
    );
  }
}
