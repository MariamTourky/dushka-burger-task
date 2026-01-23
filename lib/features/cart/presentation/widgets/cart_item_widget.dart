import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/app/core/utils/add_minus_row.dart';
import 'package:trust_develpoment/app/core/utils/card_item_widget.dart';
import 'package:trust_develpoment/features/cart/domain/entity/get_cart_item_entity.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final GetCartItemEntity item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CardItemWidget(
      onTap: () {
        context.push(
          '${RouteName.productDetailsPage}?id=${item.productId}',
          extra: item.quantity,
        );
      },

      imageUrl: item.image,
      title: item.nameByLocale(context.locale.languageCode),
      subtitle: item.total,
      tags: item.addons.map((e) => e.name).toList(),
      trailing: AddMinusRow(
        quantity: item.quantity,
        minusIconDesign: Icons.delete_outline,
        onAddTap: () {
          context.push(
            '${RouteName.productDetailsPage}?id=${item.productId}',
            extra: item.quantity + 1,
          );
        },

        onMinusTap: () {
          context.read<CartCubit>().removeItem(
            productId: item.productId,
            quantity: 1,
          );
        },
      ),
    );
  }
}
