import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/app/core/utils/back_container.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/cart_button.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class ProductDetailsHeader extends StatelessWidget {
  final int itemCount;
  const ProductDetailsHeader({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackContainer(),
          Text(
            LocaleKeys.product_details.tr(),
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.darkRed,
            ),
          ),
          CartButton(itemCount: itemCount),
        ],
      ),
    );
  }
}
