import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/cart_item_request.dart';

part 'add_to_cart_request.g.dart';

@JsonSerializable()
class AddToCartRequest {
  @JsonKey(name: "guest_id")
  final String guestId;

  final List<CartItemRequest> items;

  AddToCartRequest({required this.guestId, required this.items});

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}
