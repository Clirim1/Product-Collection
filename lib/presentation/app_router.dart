import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter/presentation/screens/login_screen.dart';
import 'package:pixelfield_flutter/presentation/screens/welcome_screen.dart';
import 'screens/collection_screen.dart';
import 'screens/product_detail_screen.dart';
import '../../data/models/product_model.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => WelcomeScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/collection',
        builder: (context, state) => CollectionScreen(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
    ],
  );
}
