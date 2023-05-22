// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      subCategory: $enumDecode(_$SubCategoryEnumMap, json['subCategory']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'price': instance.price,
      'category': _$CategoryEnumMap[instance.category]!,
      'subCategory': _$SubCategoryEnumMap[instance.subCategory]!,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CategoryEnumMap = {
  Category.clothes: 'clothes',
  Category.toys: 'toys',
};

const _$SubCategoryEnumMap = {
  SubCategory.all: 'all',
  SubCategory.plastic: 'plastic',
  SubCategory.plush: 'plush',
  SubCategory.wooden: 'wooden',
  SubCategory.women: 'women',
  SubCategory.men: 'men',
  SubCategory.children: 'children',
};
