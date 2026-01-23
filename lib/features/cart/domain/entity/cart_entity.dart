import 'package:trust_develpoment/features/cart/data/models/response_model/cart_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;
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
    List<CartItemEntity>? items,
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

extension CartResponseMapper on CartResponse {
  CartEntity toEntity() {
    return CartEntity(
      items: items?.map((e) => e.toEntity()).toList() ?? [],
      totalItems: totalItems ?? 0,
      totalPrice: totalPrice ?? "0",
      totalPriceWithTax: totalPriceWithTax ?? "0",
    );
  }
}
