import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkRed : AppColors.disabled,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.divider,
              backgroundImage: category.image.isNotEmpty
                  ? NetworkImage(category.image)
                  : null,
              child: category.image.isEmpty
                  ? const Icon(Icons.category, color: AppColors.surface)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              category.dataByLocale(context.locale.languageCode),
              style: TextStyle(
                color: isSelected ? AppColors.surface : AppColors.darkRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
