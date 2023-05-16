// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['uuid'] as String,
      json['name'] as String,
      json['brand'] as String,
      json['description'] as String,
      json['price'] as int,
      $enumDecode(_$CategoryEnumMap, json['category']),
      $enumDecode(_$SubCategoryEnumMap, json['subCategory']),
      json['imageUrl'] as String?,
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
    };

const _$CategoryEnumMap = {
  Category.clothes: 'clothes',
  Category.toys: 'toys',
};

const _$SubCategoryEnumMap = {
  SubCategory.plastic: 'plastic',
  SubCategory.plush: 'plush',
  SubCategory.wooden: 'wooden',
  SubCategory.women: 'women',
  SubCategory.men: 'men',
  SubCategory.children: 'children',
};
