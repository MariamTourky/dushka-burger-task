// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonResponse _$AddonResponseFromJson(Map<String, dynamic> json) =>
    AddonResponse(
      id: (json['id'] as num).toInt(),
      titleEn: json['title'] as String,
      titleAr: json['title_ar'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => AddonOptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonResponseToJson(AddonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.titleEn,
      'title_ar': instance.titleAr,
      'options': instance.options,
    };
