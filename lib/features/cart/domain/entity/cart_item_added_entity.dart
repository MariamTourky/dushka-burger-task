import 'package:trust_develpoment/features/cart/data/models/request_models/cart_item_request.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

class CartItemAddedEntity {
  final int productId;
  final int quantity;
  final List<AddonItemAddedEntity> addons;

  const CartItemAddedEntity({
    required this.productId,
    required this.quantity,
    this.addons = const [],
  });
}

extension CartItemEntityMapper on CartItemAddedEntity {
  CartItemRequest toRequest() {
    return CartItemRequest(
      productId: productId,
      quantity: quantity,
      addons: addons.map((e) => e.toRequest()).toList(),
    );
  }
}
