import 'package:equatable/equatable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

class ProductDetailsState extends Equatable {
  final Resource<ProductEntity> product;
  final Resource<List<AddonBlockEntity>> addons;
  final int quantity;
  final Map<int, int?> selectedOptions;

  const ProductDetailsState({
    required this.product,
    required this.addons,
    this.quantity = 0,
    this.selectedOptions = const {},
  });

  factory ProductDetailsState.initial() => ProductDetailsState(
    product: Resource.initial(),
    addons: Resource.initial(),
    quantity: 0,
    selectedOptions: {},
  );

  ProductDetailsState copyWith({
    Resource<ProductEntity>? product,
    Resource<List<AddonBlockEntity>>? addons,
    int? quantity,
    Map<int, int?>? selectedOptions,
  }) {
    return ProductDetailsState(
      product: product ?? this.product,
      addons: addons ?? this.addons,
      quantity: quantity ?? this.quantity,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  List<Object?> get props => [product, addons, quantity, selectedOptions];
}
