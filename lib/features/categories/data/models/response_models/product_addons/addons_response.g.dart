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
      minMaxRules: json['min_max_rules'] == null
          ? null
          : MinMaxRulesResponse.fromJson(
              json['min_max_rules'] as Map<String, dynamic>,
            ),
      required: json['required'] as bool?,
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
      'min_max_rules': instance.minMaxRules,
      'required': instance.required,
      'IsMultiChoise': instance.isMultiChoice,
      'options': instance.options,
    };
