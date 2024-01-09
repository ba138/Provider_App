import 'package:flutter/foundation.dart';
import 'package:provider_app/model/productModel.dart';
import 'package:provider_app/model/categroies_model.dart';

class HomeModel {
  List<Product> allProducts;
  List<Product> newProducts;
  List<Product> mostSales;
  List<CategoryModel> categories;

  HomeModel({
    required this.allProducts,
    required this.newProducts,
    required this.mostSales,
    required this.categories,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      allProducts: (json['all_products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      newProducts: (json['new_products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      mostSales: (json['most_sales'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      categories: (json['categories'] as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList(),
    );
  }
}
