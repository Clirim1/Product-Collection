import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;
  static const _productsKey = 'cached_products_json';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveProductsJson(String json) async {
    await _prefs?.setString(_productsKey, json);
  }

  static String? getProductsJson() {
    return _prefs?.getString(_productsKey);
  }
}
