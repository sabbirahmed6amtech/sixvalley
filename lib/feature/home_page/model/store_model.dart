class StoreModel {
  final String id;
  final String name;
  final String imageUrl;
  final double? rating;
  final int? reviewCount;
  final String? logoUrl;
  final int? stockLeft;
  const StoreModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.logoUrl,
    required this.rating,
    required this.reviewCount,
    required this.stockLeft
  });

  static List<StoreModel> storeData =[
    const StoreModel(
      id: '1',
      name: 'Blue Color Short Dr...',
      imageUrl: 'assets/images/banner1.png',
      logoUrl: 'assets/images/store_logo1.png',
      rating: 4.5,
      reviewCount: 12,
      stockLeft: 100
    ),
    const StoreModel(
        id: '1',
        name: 'Blue Color Short Dr...',
        imageUrl: 'assets/images/banner2.png',
        logoUrl: 'assets/images/store_logo2.png',
        rating: 4.5,
        reviewCount: 12,
        stockLeft: 100
    ),
    const StoreModel(
        id: '1',
        name: 'Blue Color Short Dr...',
        imageUrl: 'assets/images/banner1.png',
        logoUrl: 'assets/images/store_logo1.png',
        rating: 4.5,
        reviewCount: 12,
        stockLeft: 100
    ),
  ];
}