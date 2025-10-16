import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';
import '../../core/storage/local_storage.dart';

class ProductLocalDataSource {
  Future<List<Product>> loadFromAssets() async {
    final str = await rootBundle.loadString('assets/mock_data/products.json');
    final map = jsonDecode(str) as Map<String, dynamic>;
    final list = (map['products'] as List)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  List<Product> loadFromCache() {
    final str = LocalStorage.getProductsJson();
    if (str == null) return [];
    final map = jsonDecode(str) as Map<String, dynamic>;
    return (map['products'] as List)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveToCache(String json) async {
    await LocalStorage.saveProductsJson(json);
  }
}
