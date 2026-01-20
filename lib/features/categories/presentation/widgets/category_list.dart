import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int? selectedId;
  final Function(int) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryItem(
          category: category,
          isSelected: selectedId == category.id,
          onTap: () => onCategorySelected(category.id),
        );
      },
    );
  }
}
