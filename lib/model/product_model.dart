/// Unified Product Model
/// Supports all product card variations (deal, featured, etc.)
class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double currentPrice;
  final double? originalPrice;
  final int? discountPercent;
  final double? rating;
  final int? reviewCount;
  final String? badge;
  final bool isFavorite;
  final int? stockLeft;

  const ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    this.originalPrice,
    this.discountPercent,
    this.rating,
    this.reviewCount,
    this.badge,
    this.isFavorite = false,
    this.stockLeft,
  });

  /// Check discount
  bool get hasDiscount =>
      originalPrice != null && discountPercent != null && discountPercent! > 0;

  /// Check rating
  bool get hasRating => rating != null && reviewCount != null;

  /// Check badge
  bool get hasBadge => badge != null && badge!.isNotEmpty;

  /// Sample data for Today's Deal
  static const ProductModel todaysDealProduct = ProductModel(
    id: 'today_1',
    name: 'Red Color Short Dress for Girls...',
    imageUrl: 'assets/images/todays_deal.png',
    currentPrice: 100965.00,
    originalPrice: 1100,
    discountPercent: 10,
    rating: 4.5,
    reviewCount: 12,
    stockLeft: 22,
    isFavorite: true,
  );

  /// Sample data for Deal products (smaller cards, no rating)
  static List<ProductModel> dealProducts = [
    const ProductModel(
      id: '1',
      name: 'Blue Color Short Dr...',
      imageUrl: 'assets/images/image1.png',
      currentPrice: 3237.87,
      originalPrice: 1100,
      discountPercent: 10,
      isFavorite: true,
    ),
    const ProductModel(
      id: '2',
      name: 'Blue Color Short Dr...',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 12.09,
      originalPrice: 1100,
      discountPercent: 5,
      isFavorite: false,
    ),
    const ProductModel(
      id: '3',
      name: 'Blue Color Short',
      imageUrl: 'assets/images/prod3.png',
      currentPrice: 12.09,
      originalPrice: 1100,
      discountPercent: 4,
      isFavorite: false,
    ),
    const ProductModel(
      id: '4',
      name: 'Blue Color Short',
      imageUrl: 'assets/images/prod2.png',
      currentPrice: 12.09,
      originalPrice: 1100,
      discountPercent: 4,
      isFavorite: false,
    ),
  ];

  /// Sample data for Featured products (larger cards, with rating & badge)
  static List<ProductModel> featuredProducts = [
    const ProductModel(
      id: '1',
      name: 'Red Color Short Dress fo...',
      imageUrl: 'assets/images/fea_prod1.png',
      currentPrice: 323.87,
      originalPrice: 1100,
      discountPercent: 5,
      rating: 4.5,
      reviewCount: 12,
      badge: 'Best Selling',
      isFavorite: true,
    ),
    const ProductModel(
      id: '2',
      name: 'Red Color Short Dress fo...',
      imageUrl: 'assets/images/fea_prod2.png',
      currentPrice: 323.87,
      originalPrice: 1100,
      discountPercent: 5,
      rating: 4.5,
      reviewCount: 12,
      badge: 'Best Selling',
      isFavorite: false,
    ),
    const ProductModel(
      id: '3',
      name: 'Red Color Short',
      imageUrl: 'assets/images/fea_prod3.png',
      currentPrice: 323.87,
      originalPrice: 1100,
      discountPercent: 4,
      rating: 4.5,
      reviewCount: 12,
      isFavorite: false,
    ),
  ];
}
