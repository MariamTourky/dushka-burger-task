import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/app/core/utils/custom_icon.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push('${RouteName.productDetails}?id=${product.id}');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: product.image.isNotEmpty
                      ? Image.network(product.image, fit: BoxFit.cover)
                      : Container(color: AppColors.divider),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.dataByLocale(context.locale.languageCode),
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.coinsByLocal(context.locale.languageCode),
                      style: AppTextStyles.priceSmall,
                    ),
                  ],
                ),
              ),
              CustomIcon(
                icon: Icons.add,
                isEnabled: true,
                onTap: () {
                  context.push(
                    '${RouteName.productDetails}?id=${product.id}&quantity=1',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
