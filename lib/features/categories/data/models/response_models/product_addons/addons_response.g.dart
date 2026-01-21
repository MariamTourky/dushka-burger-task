// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonResponse _$AddonResponseFromJson(Map<String, dynamic> json) =>
    AddonResponse(
      id: int.parse(json['id'] as String),
      titleEn: json['title'] as String,
      titleAr: json['title_ar'] as String,
      isMultiChoice: json['IsMultiChoise'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => AddonOptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonResponseToJson(AddonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleEn,
      'title_ar': instance.titleAr,
      'IsMultiChoise': instance.isMultiChoice,
      'options': instance.options,
    };
