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

  Product(this.uuid, this.name, this.brand, this.description, this.price, this.category, this.subCategory, this.imageUrl);


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);


  ProductsCompanion toProductsCompanion() => ProductsCompanion(
      uuid: Value(uuid),
      name: Value(name),
      brand: Value(brand),
      description: Value(description),
      price: Value(price),
      category: Value(category),
      subCategory: Value(subCategory),
      image: Value(imageUrl)
  );

  factory Product.fromDB(ProductDB product) => Product(
      product.uuid,
      product.name,
      product.brand,
      product.description,
      product.price,
      product.category,
      product.subCategory,
      product.image!
  );
}

enum Category {
  clothes,
  toys
}

enum SubCategory{
  plastic,
  plush,
  wooden,
  women,
  men,
  children
}
