import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/cart/domain/entity/get_cart_item_entity.dart';
import 'package:trust_develpoment/features/cart/presentation/widgets/cart_item_widget.dart';

class CartItemsList extends StatelessWidget {
  final List<GetCartItemEntity> items;

  const CartItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CartItemWidget(item: items[index]);
      },
    );
  }
}
