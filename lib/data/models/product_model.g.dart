// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  quantity: json['quantity'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'quantity': instance.quantity,
  'description': instance.description,
};
