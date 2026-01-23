import 'package:equatable/equatable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

class CategoriesState extends Equatable {
  final BaseState<List<CategoryEntity>> categories;
  final int? selectedCategoryId;

  const CategoriesState({required this.categories, this.selectedCategoryId});

  factory CategoriesState.initial() => CategoriesState(
    categories: BaseState.initial(),
    selectedCategoryId: null,
  );

  List<ProductEntity>? get selectedProducts {
    final selectedCategory = categories.data?.firstWhere(
      (c) => c.id == selectedCategoryId,
      orElse: () => categories.data!.first,
    );
    return selectedCategory?.products;
  }

  CategoriesState copyWith({
    BaseState<List<CategoryEntity>>? categories,
    int? selectedCategoryId,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props => [categories, selectedCategoryId];
}
