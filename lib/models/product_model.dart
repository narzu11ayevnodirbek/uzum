class ProductModel {
  final String id;
  final String title;
  final String price;
  final String image;
  final String description;
  final List<String> colors;
  final String lastSeen;
  final String? shopImage;
  final String shopName;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.colors,
    required this.lastSeen,
    this.shopImage,
    required this.shopName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      title: json["title"] ?? "",
      price: json["price"] ?? "",
      image: json["image_url"] ?? "",
      description: json["description"] ?? "",
      colors: List<String>.from(json["colors"] ?? []),
      lastSeen: json["last_seen"] ?? "",
      shopImage: json["shop_image"] ?? "",
      shopName: json["shop_name"] ?? "",
    );
  }
}
