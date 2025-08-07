import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/utils/theme.dart';
import 'package:yumquick/utils/bottomnav.dart';
import 'package:yumquick/models/product.dart';
import 'package:yumquick/services/product_service.dart';
import 'package:yumquick/widgets/category_icon.dart';
import 'package:yumquick/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();
  List<Product> _bestSellers = [];
  List<Product> _recommended = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final products = await _productService.fetchProducts();
    setState(() {
      _bestSellers = products.where((p) => p.isBestSeller).toList();
      _recommended = products.where((p) => p.isRecommended).toList();
      _isLoading = false;
    });
  }

  Widget _buildDrawerItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.white),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontSize: 16),
      ),
      onTap: onTap,
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
                      backgroundImage: AssetImage('assets/images/shake.png'),
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
              _buildDrawerItem(Icons.shopping_bag_rounded, 'My Orders',
                  onTap: () {
                Navigator.pop(context);
                context.go('/orders');
              }),
              const Divider(color: Colors.white54),
              _buildDrawerItem(Icons.person_outline, 'My Profile'),
              const Divider(color: Colors.white54),
              _buildDrawerItem(Icons.location_on_outlined, 'Delivery Address'),
              const Divider(color: Colors.white54),
              _buildDrawerItem(Icons.credit_card_outlined, 'Payment Methods'),
              const Divider(color: Colors.white54),
              _buildDrawerItem(
                Icons.menu_book,
                'Recipes',
                onTap: () {
                  Navigator.pop(context);
                  context.go('/recipes');
                },
              ),
              const Divider(color: Colors.white54),
              _buildDrawerItem(
                Icons.phone_outlined,
                'Contact Us',
                onTap: () {
                  Navigator.pop(context);
                  context.go('/contact');
                },
              ),
              const Divider(color: Colors.white54),
              _buildDrawerItem(Icons.help_rounded, 'Help & FAQs', onTap: () {
                Navigator.pop(context);
                context.go('/help');
              }),
              const Divider(color: Colors.white54),
              _buildDrawerItem(Icons.settings_outlined, 'Settings'),
              const Spacer(),
              const Divider(color: Colors.white54),
              TextButton.icon(
                onPressed: () => context.go("/login"),
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
                              CategoryIcon(imagePath: 'assets/icons/snack.png'),
                              CategoryIcon(imagePath: 'assets/icons/meal.png'),
                              CategoryIcon(imagePath: 'assets/icons/vegan.png'),
                              CategoryIcon(
                                  imagePath: 'assets/icons/dessert.png'),
                              CategoryIcon(imagePath: 'assets/icons/drink.png'),
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
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SizedBox(
                                  height: 160,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _bestSellers.length,
                                    itemBuilder: (context, index) {
                                      final product = _bestSellers[index];
                                      return ProductCard(
                                        imageUrl: product.imageUrl,
                                        price: product.price,
                                      );
                                    },
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
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SizedBox(
                                  height: 220,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _recommended.length,
                                    itemBuilder: (context, index) {
                                      final product = _recommended[index];
                                      return ProductCard(
                                        imageUrl: product.imageUrl,
                                        price: product.price,
                                        showRating: true,
                                        rating: product.rating ?? '',
                                        isLarge: true,
                                      );
                                    },
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
          const BottomNav(currentIndex: 0),
        ],
      ),
    );
  }
}

// CategoryIcon and ProductCard widgets remain unchanged.
