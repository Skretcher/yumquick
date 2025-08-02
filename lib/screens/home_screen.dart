import 'package:flutter/material.dart';
import 'package:yumquick/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.white),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontSize: 16),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 365,
        backgroundColor: AppColors.deepOrange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(90),
            bottomLeft: Radius.circular(90),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Smith',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'loremipsum@email.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildDrawerItem(Icons.shopping_bag_outlined, 'My Orders'),
              _buildDrawerItem(Icons.person_outline, 'My Profile'),
              _buildDrawerItem(Icons.location_on_outlined, 'Delivery Address'),
              _buildDrawerItem(Icons.credit_card_outlined, 'Payment Methods'),
              _buildDrawerItem(Icons.phone_outlined, 'Contact Us'),
              _buildDrawerItem(Icons.help_outline, 'Help & FAQs'),
              _buildDrawerItem(Icons.settings_outlined, 'Settings'),
              const Spacer(),
              const Divider(color: Colors.white54),
              TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.logout, color: AppColors.white),
                label: const Text('Log Out',
                    style: TextStyle(color: AppColors.white)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.yellowDark,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppSizes.buttonRadius),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 8),
                              Text('Search',
                                  style: TextStyle(color: Colors.grey)),
                              Spacer(),
                              Icon(Icons.tune, color: AppColors.deepOrange),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.shopping_cart_outlined,
                          color: AppColors.white),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none,
                          color: AppColors.white),
                      const SizedBox(width: 12),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () => Scaffold.of(context).openEndDrawer(),
                          child: const Icon(Icons.person_outline,
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text('Good Morning', style: AppTextStyles.welcome),
                        SizedBox(height: 4),
                        Text(
                          "Rise And Shine! It's Breakfast Time",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.deepOrange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppSizes.cardRadius),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryIcon(
                                  label: "Snacks", icon: Icons.fastfood),
                              CategoryIcon(
                                  label: "Meal", icon: Icons.restaurant),
                              CategoryIcon(label: "Vegan", icon: Icons.eco),
                              CategoryIcon(
                                  label: "Dessert", icon: Icons.icecream),
                              CategoryIcon(
                                  label: "Drinks", icon: Icons.local_drink),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Best Seller',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text('View All',
                                  style:
                                      TextStyle(color: AppColors.deepOrange)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                ProductCard(
                                    imageUrl: 'assets/images/Rectangle133.png',
                                    price: '\$103.0'),
                                ProductCard(
                                    imageUrl: 'assets/images/Rectangle134.png',
                                    price: '\$50.0'),
                                ProductCard(
                                    imageUrl: 'assets/images/Rectangle135.png',
                                    price: '\$12.99'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/Frame71.png',
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: const Text(
                                        ' Experience our \n Delicious New Dish',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 70,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      child: const Text(
                                        ' 30% OFF',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Recommend',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text('View All',
                                  style:
                                      TextStyle(color: AppColors.deepOrange)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 220,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                ProductCard(
                                  imageUrl: 'assets/images/Rectangle137.png',
                                  price: '\$10.0',
                                  showRating: true,
                                  rating: '5.0',
                                  isLarge: true,
                                ),
                                ProductCard(
                                  imageUrl: 'assets/images/Rectangle128.png',
                                  price: '\$25.0',
                                  showRating: true,
                                  rating: '4.5',
                                  isLarge: true,
                                ),
                                ProductCard(
                                  imageUrl: 'assets/images/Rectangle134.png',
                                  price: '\$32.0',
                                  showRating: true,
                                  rating: '4.7',
                                  isLarge: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
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
                  IconButton(
                      icon: const Icon(Icons.home_outlined,
                          color: AppColors.white, size: 28),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.search,
                          color: AppColors.white, size: 28),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: AppColors.white, size: 28),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: AppColors.white, size: 28),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.person_outline,
                          color: AppColors.white, size: 28),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryIcon({required this.label, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade100,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: AppColors.deepOrange, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

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
