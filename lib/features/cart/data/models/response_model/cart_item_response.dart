import 'package:json_annotation/json_annotation.dart';

part 'cart_item_response.g.dart';

@JsonSerializable()
class CartItemResponse {
  @JsonKey(name: "product_id")
  final int productId;

  @JsonKey(name: "product_name")
  final String productName;

  @JsonKey(name: "product_name_ar")
  final String productNameAr;

  final int quantity;
  final String price;

  @JsonKey(name: "addon_price")
  final num addonPrice;

  final String image;
  final String total;

  CartItemResponse({
    required this.productId,
    required this.productName,
    required this.productNameAr,
    required this.quantity,
    required this.price,
    required this.addonPrice,
    required this.image,
    required this.total,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseFromJson(json);
}
