import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_item_response.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  @JsonKey(name: "cart_items")
  final List<CartItemResponse>? items;

  @JsonKey(name: "total_items")
  final int? totalItems;

  @JsonKey(name: "total_price_with_tax")
  final String? totalPriceWithTax;

  CartResponse({this.items, this.totalItems, this.totalPriceWithTax});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
