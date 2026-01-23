import 'package:trust_develpoment/features/cart/data/mappers/to_entity/addon_item_cart_response_mapper.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_item_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/get_cart_item_entity.dart';

extension CartItemResponseMapper on CartItemResponse {
  GetCartItemEntity toEntity() {
    return GetCartItemEntity(
      productId: productId,
      productName: productName,
      productNameAr: productNameAr,
      quantity: quantity,
      price: price,
      addons: addons?.map((e) => e.toEntity()).toList() ?? [],
      image: image,
      total: total,
    );
  }
}
