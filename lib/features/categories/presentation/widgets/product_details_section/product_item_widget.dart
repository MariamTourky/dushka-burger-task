import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/app/core/utils/card_item_widget.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/app/core/utils/custom_icon.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CardItemWidget(
      imageUrl: product.image,
      imageSize: 60,
      title: product.dataByLocale(context.locale.languageCode),
      subtitle: product.coinsByLocal(context.locale.languageCode),
      trailing: CustomIcon(
        icon: Icons.add,
        isEnabled: true,
        onTap: () {
          context.push(
            '${RouteName.productDetailsPage}?id=${product.id}',
            extra: 1,
          );
        },
      ),
      onTap: () {
        context.push('${RouteName.productDetailsPage}?id=${product.id}');
      },
    );
  }
}
