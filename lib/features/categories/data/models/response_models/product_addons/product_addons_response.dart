import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/addons_block_respose.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';

part 'product_addons_response.g.dart';

@JsonSerializable()
class ProductAddonsResponse {
  final ProductResponse product;
  final List<AddonBlockResponse> blocks;

  ProductAddonsResponse({required this.product, required this.blocks});

  factory ProductAddonsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductAddonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddonsResponseToJson(this);
}
