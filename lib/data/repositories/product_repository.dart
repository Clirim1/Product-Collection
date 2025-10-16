import 'dart:convert';

import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';
import '../../core/network/network_checker.dart';

class ProductRepository {
  final String remoteUrl;
  final ProductLocalDataSource localDataSource = ProductLocalDataSource();

  ProductRepository({required this.remoteUrl});

  Future<List<Product>> loadProducts() async {
    final hasConn = await NetworkChecker.hasConnection();
    if (hasConn) {
      try {
        final remote = ProductRemoteDataSource(remoteUrl: remoteUrl);
        final json = await remote.fetchRemoteJson();

        await localDataSource.saveToCache(json);
        final map = jsonDecode(json) as Map<String, dynamic>;
        return (map['products'] as List)
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (_) {
        final cached = localDataSource.loadFromCache();
        if (cached.isNotEmpty) return cached;
        return await localDataSource.loadFromAssets();
      }
    } else {
      final cached = localDataSource.loadFromCache();
      if (cached.isNotEmpty) return cached;
      return await localDataSource.loadFromAssets();
    }
  }
}
