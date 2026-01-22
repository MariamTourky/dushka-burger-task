import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_item_added_entity.dart';

class AddToCartEntity {
  final String guestId;
  final List<CartItemAddedEntity> items;

  const AddToCartEntity({required this.guestId, required this.items});
}

extension AddToCartEntityMapper on AddToCartEntity {
  AddToCartRequest toRequest() {
    return AddToCartRequest(
      guestId: guestId,
      items: items.map((e) => e.toRequest()).toList(),
    );
  }
}
