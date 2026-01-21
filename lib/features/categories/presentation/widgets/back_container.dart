import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class BackContainer extends StatelessWidget {
  const BackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textSecondary),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              LocaleKeys.back.tr(),
              style: AppTextStyles.title.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
