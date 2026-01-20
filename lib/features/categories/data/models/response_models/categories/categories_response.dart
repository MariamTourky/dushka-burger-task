import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name_en")
  final String? nameEn;

  @JsonKey(name: "name_ar")
  final String? nameAr;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "products")
  final List<ProductResponse>? products;

  CategoriesResponse({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.products,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
