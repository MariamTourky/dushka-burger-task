import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
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

extension ProductResponseMapper on ProductResponse {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      name: nameEn ?? nameAr ?? '',
      price: price ?? '',
      image: image ?? '',
    );
  }
}
