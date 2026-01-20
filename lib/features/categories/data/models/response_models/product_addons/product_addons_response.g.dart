// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_addons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAddonsResponse _$ProductAddonsResponseFromJson(
  Map<String, dynamic> json,
) => ProductAddonsResponse(
  product: ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
  blocks: (json['blocks'] as List<dynamic>)
      .map((e) => AddonBlockResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductAddonsResponseToJson(
  ProductAddonsResponse instance,
) => <String, dynamic>{'product': instance.product, 'blocks': instance.blocks};
