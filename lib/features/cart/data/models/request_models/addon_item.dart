import 'package:json_annotation/json_annotation.dart';

part 'addon_item.g.dart';

@JsonSerializable()
class AddonItemCart {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "price")
  final String? price;

  AddonItemCart({this.id, this.name, this.price});

  Map<String, dynamic> toJson() => _$AddonItemCartToJson(this);
  factory AddonItemCart.fromJson(Map<String, dynamic> json) =>
      _$AddonItemCartFromJson(json);
}
