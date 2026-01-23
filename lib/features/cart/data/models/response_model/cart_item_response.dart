import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item_request.dart';

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
  @JsonKey(name: "addons")
  final List<AddonItemCart>? addons;

  final String image;
  final String total;

  CartItemResponse({
    required this.productId,
    required this.productName,
    required this.productNameAr,
    required this.quantity,
    required this.price,
    required this.addons,
    required this.image,
    required this.total,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseFromJson(json);
}
