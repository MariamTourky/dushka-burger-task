import 'package:trust_develpoment/features/cart/data/mappers/to_request/cart_item_added_request_mapper.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';

extension AddToCartRequestMapper on AddToCartEntity {
  AddToCartRequest toRequest() {
    return AddToCartRequest(
      guestId: guestId,
      items: items.map((e) => e.toRequest()).toList(),
    );
  }
}
