// lib/widgets/bottomnav.dart
import 'package:flutter/material.dart';
import 'package:yumquick/utils/theme.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 25,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.orange,
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
            _navItem(index: 0, icon: Icons.home_outlined),
            _navItem(index: 1, icon: Icons.dinner_dining_outlined),
            _navItem(index: 2, icon: Icons.favorite_border_outlined),
            _navItem(index: 3, icon: Icons.assignment_outlined),
            _navItem(index: 4, icon: Icons.support_agent_outlined),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    IconData? icon,
    String? assetPath,
  }) {
    final isSelected = index == currentIndex;

    return IconButton(
      onPressed: () => onTap(index),
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
