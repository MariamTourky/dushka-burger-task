import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item_request.dart';

part 'cart_item_request.g.dart';

@JsonSerializable()
class CartItemRequest {
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "addons")
  final List<AddonItemRequest>? addons;

  CartItemRequest({this.productId, this.quantity, this.addons});

  Map<String, dynamic> toJson() => _$CartItemRequestToJson(this);
}
