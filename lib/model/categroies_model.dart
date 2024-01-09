class CategoryModel {
  int id;
  String name;
  String? parent;
  String thumbnailImage;

  CategoryModel({
    required this.id,
    required this.name,
    this.parent,
    required this.thumbnailImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      parent: json['parent'],
      thumbnailImage: json['thumbnail_image'],
    );
  }
}
