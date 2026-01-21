import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/add_minus_row.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductDetailsState state;
  const ProductInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final product = state.product.data!;
    final productName = product.dataByLocale(context.locale.languageCode);
    final productDiscription = product.descriptionByLocale(
      context.locale.languageCode,
    );
    final productPrice = product.coinsByLocal(context.locale.languageCode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Divider(),
        const SizedBox(height: 12),
        Text(productName, style: AppTextStyles.headlineMedium),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productPrice, style: AppTextStyles.price),
            AddMinusRow(state: state),
          ],
        ),
        const Divider(),
        const SizedBox(height: 12),
        Text(productDiscription, style: AppTextStyles.body),
      ],
    );
  }
}
