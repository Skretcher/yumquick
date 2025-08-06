import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/utils/theme.dart';
import 'package:yumquick/utils/bottomnav.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, String>> favorites = [
    {'title': 'Chicken Curry', 'image': 'assets/images/Rectangle128.png'},
    {'title': 'Chicken Burger', 'image': 'assets/images/Rectangle133.png'},
    {'title': 'Broccoli Lasagna', 'image': 'assets/images/Rectangle135.png'},
    {'title': 'Mexican Appetizer', 'image': 'assets/images/Rectangle128.png'},
    {'title': 'Spicy Wings', 'image': 'assets/images/Rectangle133.png'},
    {'title': 'Milkshakes', 'image': 'assets/images/Rectangle136.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      appBar: AppBar(
        backgroundColor: AppColors.yellowDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/home'),
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.cardRadius),
            topRight: Radius.circular(AppSizes.cardRadius),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              "It's time to buy your favorite dish.",
              style: AppTextStyles.title.copyWith(color: AppColors.deepOrange),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.asset(
                                item['image']!,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    item['isFavorite'] == 'true'
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: AppColors.deepOrange,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      favorites.removeAt(index);
                                      // Items reappear after page reload since this list is not persistent
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: AppTextStyles.title,
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Lorem ipsum dolor sit amet, consectetur.',
                                style: AppTextStyles.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 2),
    );
  }
}
