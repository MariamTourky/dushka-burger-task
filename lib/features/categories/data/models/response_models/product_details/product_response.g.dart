// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: (json['id'] as num?)?.toInt(),
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'price': instance.price,
      'image': instance.image,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
    };
