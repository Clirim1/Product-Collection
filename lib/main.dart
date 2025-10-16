import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelfield_flutter/logic/product_bloc/product_event.dart';

import 'core/storage/local_storage.dart';
import 'data/repositories/product_repository.dart';
import 'logic/product_bloc/product_bloc.dart';
import 'presentation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _repo = ProductRepository(
    remoteUrl: 'https://raw.githubusercontent.com/your/repo/products.json',
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProductBloc(repo: _repo)..add(ProductLoadRequested()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Product Collection',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF0E1C21),
            appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0E1C21)),
            textTheme: GoogleFonts.ebGaramondTextTheme().apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
