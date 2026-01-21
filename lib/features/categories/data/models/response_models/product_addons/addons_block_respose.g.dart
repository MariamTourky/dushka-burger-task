// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_block_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonBlockResponse _$AddonBlockResponseFromJson(Map<String, dynamic> json) =>
    AddonBlockResponse(
      id: int.parse(json['id'] as String),
      titleEn: json['title'] as String,
      titleAr: json['title_ar'] as String,
      isMultiChoice: json['IsMultiChoise'] as bool,
      addons: (json['addons'] as List<dynamic>)
          .map((e) => AddonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonBlockResponseToJson(AddonBlockResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleEn,
      'title_ar': instance.titleAr,
      'IsMultiChoise': instance.isMultiChoice,
      'addons': instance.addons,
    };
