import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/app/core/utils/add_minus_row.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductDetailsState state;
  const ProductInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final product = state.product.data!;
    final lang = context.locale.languageCode;
    final name = product.dataByLocale(lang);
    final description = product.descriptionByLocale(lang).trim();
    final price = product.coinsByLocal(lang);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),

        Text(name, style: AppTextStyles.headlineMedium),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(price, style: AppTextStyles.price),
            AddMinusRow(
              quantity: state.quantity,
              minusIconDesign: Icons.remove,
              onAddTap: () =>
                  context.read<ProductDetailsCubit>().incrementQuantity(),
              onMinusTap: () =>
                  context.read<ProductDetailsCubit>().decrementQuantity(),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.body.copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          const Divider(),
        ],
      ],
    );
  }
}
