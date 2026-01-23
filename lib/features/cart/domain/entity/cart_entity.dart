import 'package:trust_develpoment/features/cart/domain/entity/get_cart_item_entity.dart';

class CartEntity {
  final List<GetCartItemEntity> items;
  final int totalItems;
  final String totalPrice;
  final String totalPriceWithTax;

  const CartEntity({
    required this.items,
    required this.totalItems,
    required this.totalPrice,
    required this.totalPriceWithTax,
  });

  CartEntity copyWith({
    List<GetCartItemEntity>? items,
    int? totalItems,
    String? totalPrice,
    String? totalPriceWithTax,
  }) {
    return CartEntity(
      items: items ?? this.items,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
      totalPriceWithTax: totalPriceWithTax ?? this.totalPriceWithTax,
    );
  }
}
