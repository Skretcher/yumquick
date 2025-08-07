import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    return [
      Product(
        id: '1',
        imageUrl: 'assets/images/Rectangle133.png',
        price: '\$103.0',
        isBestSeller: true,
      ),
      Product(
        id: '2',
        imageUrl: 'assets/images/Rectangle134.png',
        price: '\$50.0',
        isBestSeller: true,
        isRecommended: true,
        rating: '4.7',
      ),
      Product(
        id: '3',
        imageUrl: 'assets/images/Rectangle135.png',
        price: '\$12.99',
        isBestSeller: true,
      ),
      Product(
        id: '4',
        imageUrl: 'assets/images/Rectangle137.png',
        price: '\$10.0',
        isRecommended: true,
        rating: '5.0',
      ),
      Product(
        id: '5',
        imageUrl: 'assets/images/Rectangle128.png',
        price: '\$25.0',
        isRecommended: true,
        rating: '4.5',
      ),
    ];
  }
}
