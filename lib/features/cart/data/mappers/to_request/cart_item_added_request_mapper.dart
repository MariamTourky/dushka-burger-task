import 'package:trust_develpoment/features/cart/data/mappers/to_request/addons_item_request_mapper.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request/cart_item_added_request.dart';

import 'package:trust_develpoment/features/cart/domain/entity/add_cart_item_entity.dart';

extension CartItemRequestMapper on AddCartItemEntity {
  CartItemAddedRequest toRequest() {
    return CartItemAddedRequest(
      productId: productId,
      quantity: quantity,
      addons: addons.map((e) => e.toRequest()).toList(),
    );
  }
}
