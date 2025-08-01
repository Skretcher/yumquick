import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // for floating effect
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD55F), Color(0xFFFFCC80)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search & Icons
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 8),
                              Text('Search',
                                  style: TextStyle(color: Colors.grey)),
                              Spacer(),
                              Icon(Icons.tune, color: Colors.deepOrange),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none, color: Colors.white),
                      const SizedBox(width: 12),
                      const Icon(Icons.person_outline, color: Colors.white),
                    ],
                  ),
                ),

                // Greetings
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rise And Shine! It's Breakfast Time",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFF5722),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // White Container
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Categories
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryIcon(label: "Snacks", icon: Icons.fastfood),
                            CategoryIcon(label: "Meal", icon: Icons.restaurant),
                            CategoryIcon(label: "Vegan", icon: Icons.eco),
                            CategoryIcon(
                                label: "Dessert", icon: Icons.icecream),
                            CategoryIcon(
                                label: "Drinks", icon: Icons.local_drink),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Best Seller
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Best Seller',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('View All',
                                style: TextStyle(color: Color(0xFFFF5722))),
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

                        // Promo Banner
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/Frame71.png',
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Recommend
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Recommend',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('View All',
                                style: TextStyle(color: Color(0xFFFF5722))),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 220, // Larger height than Best Seller
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom NavBar – Floating style
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.deepOrange),
            Icon(Icons.favorite_border, color: Colors.grey),
            Icon(Icons.shopping_bag_outlined, color: Colors.grey),
            Icon(Icons.receipt_long, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// Category icon widget
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
          child: Icon(icon, color: Colors.deepOrange, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Product card widget
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
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                  ],
                ),
              ),
            ),
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
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
