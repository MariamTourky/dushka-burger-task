import 'package:trust_develpoment/features/cart/domain/entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;
  final int totalItems;
  final String totalPriceWithTax;

  CartEntity({
    required this.items,
    required this.totalItems,
    required this.totalPriceWithTax,
  });
}
