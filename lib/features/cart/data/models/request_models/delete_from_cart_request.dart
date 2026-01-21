import 'package:json_annotation/json_annotation.dart';

part 'delete_from_cart_request.g.dart';

@JsonSerializable()
class DeleteFromCartRequest {
  @JsonKey(name: "guest_id")
  final String guestId;

  @JsonKey(name: "product_id")
  final String productId;

  final int quantity;

  DeleteFromCartRequest({
    required this.guestId,
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$DeleteFromCartRequestToJson(this);
}
