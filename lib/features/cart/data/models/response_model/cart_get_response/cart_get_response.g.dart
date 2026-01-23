// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_get_response.dart';

CartGetResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return CartGetResponse(
    items: (json['cart_items'] as List<dynamic>?)
        ?.map((e) => CartItemResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalItems: json['total_items'] as int?,
    totalPrice: json['total_price'] as String?,
    totalPriceWithTax: json['total_price_with_tax'] as String?,
  );
}
