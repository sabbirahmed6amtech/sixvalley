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
    required this.stockLeft,
  });
  //some dummy store data
  static List<StoreModel> storeData =[

  ];
}
