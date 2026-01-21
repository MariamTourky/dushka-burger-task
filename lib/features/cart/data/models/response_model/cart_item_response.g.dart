// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemResponse _$CartItemResponseFromJson(Map<String, dynamic> json) =>
    CartItemResponse(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productNameAr: json['product_name_ar'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: json['price'] as String,
      addonPrice: json['addon_price'] as num,
      image: json['image'] as String,
      total: json['total'] as String,
    );
