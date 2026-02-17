// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
      name: json['name'] as String,
      description: json['description'] as String,
      detailedDescription: json['detailedDescription'] as String,
      price: (json['price'] as num).toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      benefits:
          (json['benefits'] as List<dynamic>).map((e) => e as String).toList(),
      sideEffects: (json['sideEffects'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      developmentStory: json['developmentStory'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'detailedDescription': instance.detailedDescription,
      'price': instance.price,
      'mrp': instance.mrp,
      'images': instance.images,
      'category': instance.category,
      'ingredients': instance.ingredients,
      'benefits': instance.benefits,
      'sideEffects': instance.sideEffects,
      'developmentStory': instance.developmentStory,
      'id': instance.id,
    };
