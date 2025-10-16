import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';

class ProductState extends Equatable {
  final List<Product> all;
  final List<Product> filtered;
  final bool loading;
  final String? error;

  const ProductState({
    required this.all,
    required this.filtered,
    required this.loading,
    this.error,
  });

  factory ProductState.initial() => ProductState(all: [], filtered: [], loading: false);

  ProductState copyWith({
    List<Product>? all,
    List<Product>? filtered,
    bool? loading,
    String? error,
  }) {
    return ProductState(
      all: all ?? this.all,
      filtered: filtered ?? this.filtered,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [all, filtered, loading, error];
}
