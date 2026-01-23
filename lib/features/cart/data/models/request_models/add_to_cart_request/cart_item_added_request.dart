import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item.dart';

part 'cart_item_added_request.g.dart';

@JsonSerializable()
class CartItemAddedRequest {
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "addons")
  final List<AddonItemCart>? addons;

  CartItemAddedRequest({this.productId, this.quantity, this.addons});

  Map<String, dynamic> toJson() => _$CartItemAddedRequestToJson(this);
}
