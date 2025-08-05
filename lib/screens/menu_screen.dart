import 'package:flutter/material.dart';
import 'package:yumquick/utils/theme.dart';
import 'package:yumquick/utils/bottomnav.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    'Snacks',
    'Meal',
    'Vegan',
    'Dessert',
    'Drinks'
  ];

  final Map<String, String> categoryIcons = {
    'Snacks': 'assets/icons/snack.png',
    'Meal': 'assets/icons/meal.png',
    'Vegan': 'assets/icons/vegan.png',
    'Dessert': 'assets/icons/dessert.png',
    'Drinks': 'assets/icons/drink.png',
  };

  final List<Map<String, String>> menuItems = [
    {
      'title': 'Mexican Appetizer',
      'description': 'Tortilla chips with toppings',
      'price': '\$15.00',
      'image': 'assets/images/Snacks1.png',
      'type': 'Snacks'
    },
    {
      'title': 'Spring Rolls',
      'description': 'Vegetable spring rolls',
      'price': '\$10.00',
      'image': 'assets/images/Snacks2.png',
      'type': 'Snacks'
    },
    {
      'title': 'Grilled Chicken',
      'description': 'Served with fries and salad',
      'price': '\$18.00',
      'image': 'assets/images/meal1.png',
      'type': 'Meal'
    },
    {
      'title': 'Beef Steak',
      'description': 'Juicy steak with garlic butter',
      'price': '\$25.00',
      'image': 'assets/images/meal2.png',
      'type': 'Meal'
    },
    {
      'title': 'Vegan Bowl',
      'description': 'Healthy grains and veggies',
      'price': '\$12.00',
      'image': 'assets/images/veg1.png',
      'type': 'Vegan'
    },
    {
      'title': 'Tofu Stir Fry',
      'description': 'Tofu with broccoli and soy',
      'price': '\$13.50',
      'image': 'assets/images/veg2.png',
      'type': 'Vegan'
    },
    {
      'title': 'Chocolate Cake',
      'description': 'Rich chocolate layers',
      'price': '\$7.50',
      'image': 'assets/images/des2.png',
      'type': 'Dessert'
    },
    {
      'title': 'Fruit Tart',
      'description': 'Tart with seasonal fruits',
      'price': '\$6.00',
      'image': 'assets/images/des1.png',
      'type': 'Dessert'
    },
    {
      'title': 'Iced Latte',
      'description': 'Cold brew with milk',
      'price': '\$5.00',
      'image': 'assets/images/dr1.png',
      'type': 'Drinks'
    },
    {
      'title': 'Smoothie',
      'description': 'Mixed fruit smoothie',
      'price': '\$4.50',
      'image': 'assets/images/dr2.png',
      'type': 'Drinks'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final selectedCategory = categories[selectedCategoryIndex];
    final filteredItems =
        menuItems.where((item) => item['type'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Container(
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
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.inputRadius),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: AppColors.deepOrange),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.person_outline,
                          color: AppColors.deepOrange),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.deepOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cardRadius),
                  topRight: Radius.circular(AppSizes.cardRadius),
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedCategoryIndex;
                final category = categories[index];
                return GestureDetector(
                  onTap: () => setState(() => selectedCategoryIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.white : AppColors.deepOrange,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ]
                          : [],
                    ),
                    child: Transform.translate(
                      offset: isSelected ? const Offset(0, -6) : Offset.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          categoryIcons[category]!,
                          fit: BoxFit.contain,
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 250,
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        const Text('Sort by', style: AppTextStyles.subtitle),
                        const SizedBox(width: 4),
                        Text('Popular',
                            style: AppTextStyles.subtitle.copyWith(
                                color: AppColors.deepOrange,
                                fontWeight: FontWeight.bold)),
                        const Icon(Icons.keyboard_arrow_down,
                            color: AppColors.deepOrange),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppSizes.cardRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(AppSizes.cardRadius),
                                  topRight:
                                      Radius.circular(AppSizes.cardRadius),
                                ),
                                child: Image.asset(
                                  item['image'] ?? '',
                                  width: double.infinity,
                                  height: 180,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item['title'] ?? '',
                                            style: AppTextStyles.title,
                                          ),
                                        ),
                                        Text(
                                          item['price'] ?? '',
                                          style: AppTextStyles.price.copyWith(
                                            color: AppColors.deepOrange,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['description'] ?? '',
                                      style: AppTextStyles.subtitle,
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
          ),
          const BottomNav(currentIndex: 1),
        ],
      ),
    );
  }
}
