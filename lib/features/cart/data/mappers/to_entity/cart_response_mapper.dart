import 'package:trust_develpoment/features/cart/data/mappers/to_entity/cart_item_response_mapper.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_get_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';

extension CartResponseMapper on CartGetResponse {
  CartEntity toEntity() {
    return CartEntity(
      items: items?.map((e) => e.toEntity()).toList() ?? [],
      totalItems: totalItems ?? 0,
      totalPrice: totalPrice ?? "0",
      totalPriceWithTax: totalPriceWithTax ?? "0",
    );
  }
}
