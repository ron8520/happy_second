import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import '../database/db.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String uuid;
  final String name;
  final String brand;
  final String description;
  final int price;
  final Category category;
  final SubCategory subCategory;
  final String? imageUrl;
  final DateTime createdAt;

  Product({required this.uuid,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.createdAt,
    this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  ProductsCompanion toProductsCompanion() =>
      ProductsCompanion(
          uuid: Value(uuid),
          name: Value(name),
          brand: Value(brand),
          description: Value(description),
          price: Value(price),
          category: Value(category),
          subCategory: Value(subCategory),
          image: Value(imageUrl),
          createdAt: Value(createdAt)
      );

  factory Product.fromDB(ProductDB product) =>
      Product(
          uuid: product.uuid,
          name: product.name,
          brand: product.brand,
          description: product.description,
          price: product.price,
          category: product.category,
          subCategory: product.subCategory,
          imageUrl: product.image!,
          createdAt: product.createdAt
      );
}

enum Category { clothes, toys }

enum SubCategory { all, plastic, plush, wooden, women, men, children }
