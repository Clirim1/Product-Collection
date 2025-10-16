import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static Future<bool> hasConnection() async {
    final status = await Connectivity().checkConnectivity();
    return status != ConnectivityResult.none;
  }

  static Stream<ConnectivityResult> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged;
}
