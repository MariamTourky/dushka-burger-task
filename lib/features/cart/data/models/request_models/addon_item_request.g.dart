// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonItemCart _$AddonItemCartFromJson(Map<String, dynamic> json) =>
    AddonItemCart(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$AddonItemCartToJson(AddonItemCart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
