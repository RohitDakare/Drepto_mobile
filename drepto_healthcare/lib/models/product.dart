import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const Product._();

  const factory Product({
    required String name,
    required String description,
    required String detailedDescription,
    required double price,
    required double mrp,
    required List<String> images,
    required String category,
    required List<String> ingredients,
    required List<String> benefits,
    required List<String> sideEffects,
    required String developmentStory,
    String? id,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
