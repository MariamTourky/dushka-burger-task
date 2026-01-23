import 'package:equatable/equatable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

class ProductDetailsState extends Equatable {
  final BaseState<ProductEntity> product;
  final BaseState<List<AddonBlockEntity>> addons;
  final int quantity;
  final Map<int, int?> selectedOptions;

  const ProductDetailsState({
    required this.product,
    required this.addons,
    this.quantity = 0,
    this.selectedOptions = const {},
  });

  factory ProductDetailsState.initial() => ProductDetailsState(
    product: BaseState.initial(),
    addons: BaseState.initial(),
    quantity: 0,
    selectedOptions: {},
  );

  ProductDetailsState copyWith({
    BaseState<ProductEntity>? product,
    BaseState<List<AddonBlockEntity>>? addons,
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
