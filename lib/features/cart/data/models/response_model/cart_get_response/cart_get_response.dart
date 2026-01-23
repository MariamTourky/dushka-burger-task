import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_item_response.dart';

part 'cart_get_response.g.dart';

@JsonSerializable()
class CartGetResponse {
  @JsonKey(name: "cart_items")
  final List<CartItemResponse>? items;

  @JsonKey(name: "total_items")
  final int? totalItems;

  @JsonKey(name: "total_price")
  final String? totalPrice;

  @JsonKey(name: "total_price_with_tax")
  final String? totalPriceWithTax;

  CartGetResponse({
    this.items,
    this.totalItems,
    this.totalPrice,
    this.totalPriceWithTax,
  });

  factory CartGetResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
