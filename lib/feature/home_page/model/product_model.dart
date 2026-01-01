class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double currentPrice;
  final double? originalPrice;
  final double discountPercent;
  final double? rating;
  final int? reviewCount;
  final String? badge;
  final bool isFavorite;
  final int? stockLeft;
  final List<String> categories;

  const ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    this.originalPrice,
    required this.discountPercent,
    this.rating,
    this.reviewCount,
    this.badge,
    this.isFavorite = false,
    this.stockLeft,
    this.categories = const [],
  });

  /// Check discount
  bool get hasDiscount =>
      originalPrice != null && discountPercent != null && discountPercent! > 0;

  /// Check rating
  bool get hasRating => rating != null && reviewCount != null;

  /// Check badge
  bool get hasBadge => badge != null && badge!.isNotEmpty;

  /// Filter products by category
  static List<ProductModel> getProductsByCategory(String category) {
    return allProducts.where((p) => p.categories.contains(category)).toList();
  }

  /// All products combined for filtering
  static List<ProductModel> get allProducts => [
        ...dealProducts,
        ...featuredProducts,
        ...newUserExclusive,
      ];

  /// Sample data for Today's Deal
  static const ProductModel todaysDealProduct = ProductModel(
    id: 'today_1',
    name: 'Red Color Short Dress for Girls...',
    imageUrl: 'assets/images/todays_deal.png',
    currentPrice: 100965.00,
    originalPrice: 1100,
    discountPercent: 10.0,
    rating: 4.5,
    reviewCount: 12,
    stockLeft: 22,
    isFavorite: true,
    categories: ['New Arrivals', 'Discounted Products'],
  );

  /// Sample data for Deal products (smaller cards, no rating)
  static List<ProductModel> dealProducts = [
    const ProductModel(
      id: '1',
      name: 'Stylish Summer Dress',
      imageUrl: 'assets/images/image1.png',
      currentPrice: 89.99,
      originalPrice: 120.00,
      discountPercent: 25,
      isFavorite: true,
      rating: 4.8,
      reviewCount: 34,
      categories: ['Discounted Products', 'Top Products'],
    ),
    const ProductModel(
      id: '2',
      name: 'Casual Blue Shirt',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 45.50,
      originalPrice: 65.00,
      discountPercent: 30,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: '3',
      name: 'Elegant Evening Gown',
      imageUrl: 'assets/images/prod3.png',
      currentPrice: 156.00,
      originalPrice: 200.00,
      discountPercent: 22,
      isFavorite: false,
      rating: 4.5,
      reviewCount: 18,
      categories: ['Discounted Products', 'Top Products'],
    ),
    const ProductModel(
      id: '4',
      name: 'Sports Running Shoes',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 78.99,
      originalPrice: 110.00,
      discountPercent: 28,
      isFavorite: false,
      rating: 4.7,
      reviewCount: 56,
      categories: ['Top Products', 'Discounted Products'],
    ),
    const ProductModel(
      id: '5',
      name: 'Designer Leather Bag',
      imageUrl: 'assets/images/image1.png',
      currentPrice: 199.99,
      originalPrice: 350.00,
      discountPercent: 43,
      isFavorite: true,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: '6',
      name: 'Classic Denim Jeans',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 65.00,
      originalPrice: 85.00,
      discountPercent: 24,
      isFavorite: false,
      categories: ['Discounted Products'],
    ),
    const ProductModel(
      id: '7',
      name: 'Trendy Sneakers',
      imageUrl: 'assets/images/prod3.png',
      currentPrice: 92.50,
      originalPrice: 135.00,
      discountPercent: 31,
      isFavorite: false,
      rating: 4.6,
      reviewCount: 42,
      categories: ['New Arrivals', 'Top Products', 'Discounted Products'],
    ),
    const ProductModel(
      id: '8',
      name: 'Winter Warm Jacket',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 145.00,
      originalPrice: 220.00,
      discountPercent: 34,
      isFavorite: false,
      categories: ['Top Products', 'Discounted Products'],
    ),
    const ProductModel(
      id: '9',
      name: 'Floral Print Dress',
      imageUrl: 'assets/images/image1.png',
      currentPrice: 72.00,
      originalPrice: 95.00,
      discountPercent: 24,
      isFavorite: true,
      rating: 4.4,
      reviewCount: 28,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: '10',
      name: 'Modern Watch',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 210.00,
      originalPrice: 280.00,
      discountPercent: 25,
      isFavorite: false,
      rating: 4.9,
      reviewCount: 67,
      categories: ['Discounted Products', 'Top Products'],
    ),
    const ProductModel(
      id: '11',
      name: 'Comfortable Slippers',
      imageUrl: 'assets/images/prod3.png',
      currentPrice: 32.99,
      originalPrice: 49.99,
      discountPercent: 34,
      isFavorite: false,
      categories: ['Top Products', 'Discounted Products'],
    ),
    const ProductModel(
      id: '12',
      name: 'Cotton T-Shirt Pack',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 54.99,
      originalPrice: 79.99,
      discountPercent: 31,
      isFavorite: false,
      rating: 4.3,
      reviewCount: 89,
      categories: ['New Arrivals', 'Top Products', 'Discounted Products'],
    ),
  ];

  /// Sample data for Featured products (larger cards, with rating & badge)
  static List<ProductModel> featuredProducts = [
    const ProductModel(
      id: 'f1',
      name: 'Premium Silk Scarf',
      imageUrl: 'assets/images/fea_prod1.png',
      currentPrice: 128.00,
      originalPrice: 180.00,
      discountPercent: 29,
      rating: 4.8,
      reviewCount: 145,
      badge: 'Best Selling',
      isFavorite: true,
      categories: ['Top Products', 'Discounted Products'],
    ),
    const ProductModel(
      id: 'f2',
      name: 'Designer Sunglasses',
      imageUrl: 'assets/images/fea_prod2.png',
      discountPercent: 40.0,
      currentPrice: 95.00,
      rating: 4.6,
      reviewCount: 98,
      badge: 'Best Selling',
      isFavorite: false,
      categories: ['Top Products', 'New Arrivals'],
    ),
    const ProductModel(
      id: 'f3',
      name: 'Luxury Handbag',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 245.00,
      originalPrice: 320.00,
      discountPercent: 23,
      rating: 4.9,
      reviewCount: 203,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: 'f3',
      name: 'Luxury Handbag',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 245.00,
      originalPrice: 320.00,
      discountPercent: 23,
      rating: 4.9,
      reviewCount: 203,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: 'f3',
      name: 'Luxury Handbag',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 245.00,
      originalPrice: 320.00,
      discountPercent: 23,
      rating: 4.9,
      reviewCount: 203,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: 'f3',
      name: 'Luxury Handbag',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 245.00,
      originalPrice: 320.00,
      discountPercent: 23,
      rating: 4.9,
      reviewCount: 203,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),const ProductModel(
      id: 'f3',
      name: 'Luxury Handbag',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 245.00,
      originalPrice: 320.00,
      discountPercent: 23,
      rating: 4.9,
      reviewCount: 203,
      isFavorite: false,
      categories: ['New Arrivals', 'Discounted Products'],
    ),

  ];

  static List<ProductModel> newUserExclusive = [
    const ProductModel(
      id: 'n1',
      name: 'Smart Fitness Tracker',
      imageUrl: 'assets/images/new1.png',
      currentPrice: 135.00,
      originalPrice: 199.00,
      badge: "New",
      discountPercent: 32,
      isFavorite: true,
      rating: 4.7,
      reviewCount: 76,
      categories: ['New Arrivals', 'Discounted Products'],
    ),
    const ProductModel(
      id: 'n2',
      name: 'Wireless Earbuds Pro',
      imageUrl: 'assets/images/new2.png',
      discountPercent: 20.0,
      currentPrice: 89.00,
      isFavorite: false,
      categories: ['New Arrivals'],
    ),
    const ProductModel(
      id: 'n3',
      name: 'Minimalist Backpack',
      imageUrl: 'assets/images/prod3.png',
      currentPrice: 67.00,
      originalPrice: 85.00,
      discountPercent: 21,
      isFavorite: false,
      rating: 4.5,
      reviewCount: 52,
      categories: ['New Arrivals', 'Top Products'],
    ),
    const ProductModel(
      id: 'n4',
      name: 'Yoga Mat Set',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 42.50,
      originalPrice: 60.00,
      discountPercent: 29,
      isFavorite: false,
      categories: ['Discounted Products', 'Top Products'],
    ),

    const ProductModel(
      id: 'n4',
      name: 'Yoga Mat Set',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 42.50,
      originalPrice: 60.00,
      discountPercent: 29,
      isFavorite: false,
      categories: ['Discounted Products', 'Top Products'],
    ),









  ];
}
