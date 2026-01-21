// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_block_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonBlockResponse _$AddonBlockResponseFromJson(Map<String, dynamic> json) =>
    AddonBlockResponse(
      id: int.parse(json['id'] as String),
      titleEn: json['name'] as String,
      titleAr: json['name_ar'] as String,
      addons: (json['addons'] as List<dynamic>)
          .map((e) => AddonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonBlockResponseToJson(AddonBlockResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.titleEn,
      'name_ar': instance.titleAr,
      'addons': instance.addons,
    };
