class Product {
  final String id;
  final String imageUrl;
  final String price;
  final String? rating;
  final bool isRecommended;
  final bool isBestSeller;

  Product({
    required this.id,
    required this.imageUrl,
    required this.price,
    this.rating,
    this.isRecommended = false,
    this.isBestSeller = false,
  });
}
