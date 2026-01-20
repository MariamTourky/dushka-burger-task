// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_block_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonBlockResponse _$AddonBlockResponseFromJson(Map<String, dynamic> json) =>
    AddonBlockResponse(
      id: (json['id'] as num).toInt(),
      titleAr: json['title_ar'] as String,
      titleEn: json['title'] as String,
      isMultiChoice: json['IsMultiChoise'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => AddonOptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonBlockResponseToJson(AddonBlockResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_ar': instance.titleAr,
      'title': instance.titleEn,
      'IsMultiChoise': instance.isMultiChoice,
      'options': instance.options,
    };
