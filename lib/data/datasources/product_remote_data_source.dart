import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  final String remoteUrl;
  ProductRemoteDataSource({required this.remoteUrl});

  Future<String> fetchRemoteJson() async {
    final res = await http.get(Uri.parse(remoteUrl));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('Failed to fetch remote JSON: ${res.statusCode}');
    }
  }
}
