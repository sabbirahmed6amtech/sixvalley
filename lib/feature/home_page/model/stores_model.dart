class StoresModel {
  String? id;
  String? name;
  String? imageUrl;
  String? logoUrl;
  double? rating;
  int? reviewCount;
  int? stockLeft;

  StoresModel(
      {this.id,
        this.name,
        this.imageUrl,
        this.logoUrl,
        this.rating,
        this.reviewCount,
        this.stockLeft});

  StoresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    logoUrl = json['logoUrl'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    stockLeft = json['stockLeft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['logoUrl'] = logoUrl;
    data['rating'] = rating;
    data['reviewCount'] = reviewCount;
    data['stockLeft'] = stockLeft;
    return data;
  }
}