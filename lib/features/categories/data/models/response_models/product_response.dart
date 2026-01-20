import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name_en")
  final String? nameEn;

  @JsonKey(name: "name_ar")
  final String? nameAr;

  @JsonKey(name: "price")
  final String? price;

  @JsonKey(name: "image")
  final String? image;

  ProductResponse({this.id, this.nameEn, this.nameAr, this.price, this.image});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
