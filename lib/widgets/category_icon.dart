import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String imagePath;

  const CategoryIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
