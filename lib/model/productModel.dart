class Product {
  int id;
  String title;
  String thumbnailImage;

  Product({
    required this.id,
    required this.title,
    required this.thumbnailImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      thumbnailImage: json['thumbnail_image'],
    );
  }
}
