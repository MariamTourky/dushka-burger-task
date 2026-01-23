import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';

class AddonOptionWidget extends StatelessWidget {
  final AddonOptionEntity option;
  final bool isSelected;
  final VoidCallback onTap;

  const AddonOptionWidget({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.languageCode;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.darkRed, width: 2),
                color: isSelected ? AppColors.darkRed : Colors.transparent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                option.labelByLocale(locale),
                style: AppTextStyles.bodyBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
