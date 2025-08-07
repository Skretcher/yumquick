import 'package:flutter/material.dart';
import 'package:yumquick/utils/theme.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String price;
  final bool showRating;
  final String rating;
  final bool isLarge;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.price,
    this.showRating = false,
    this.rating = '',
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              width: isLarge ? 180 : 130,
              height: isLarge ? 200 : 140,
              fit: BoxFit.cover,
            ),
          ),
          if (showRating)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(rating,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 2),
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                  ],
                ),
              ),
            ),
          const Positioned(
            top: 8,
            right: 8,
            child:
                Icon(Icons.favorite_border, color: AppColors.white, size: 20),
          ),
          Positioned(
            bottom: 30,
            right: -1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
