import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:pixelfield_flutter/logic/product_bloc/product_bloc.dart';
import 'package:pixelfield_flutter/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../../logic/product_bloc/product_event.dart';
import '../../../logic/product_bloc/product_state.dart';
import '../widgets/product_card.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    context.read<ProductBloc>().add(ProductLoadRequested());

    await Future.delayed(const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0E1C21),
      appBar: AppBar(
        backgroundColor: const Color(0XFF0E1C21),
        title: const Text('My collection', style: TextStyle(fontSize: 32)),
        centerTitle: false,
        actions: [
          Image.asset("assets/images/notification-icon.png", width: 40),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null) {
                  return Center(child: Text(state.error!));
                }

                if (state.filtered.isEmpty) {
                  return const Center(child: Text('No products'));
                }

                return RefreshIndicator(
                  color: Colors.white,
                  backgroundColor: const Color(0XFF0E1C21),
                  onRefresh: _onRefresh,
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: state.filtered.length,
                    itemBuilder: (context, index) {
                      final p = state.filtered[index];
                      return ProductCard(
                        product: p,
                        onTap: () =>
                            GoRouter.of(context).push('/detail', extra: p),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
