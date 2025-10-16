import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String image;
  final String quantity;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
