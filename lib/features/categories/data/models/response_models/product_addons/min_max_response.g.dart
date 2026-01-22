// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'min_max_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinMaxRulesResponse _$MinMaxRulesResponseFromJson(Map<String, dynamic> json) =>
    MinMaxRulesResponse(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      exact: (json['exact'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MinMaxRulesResponseToJson(
  MinMaxRulesResponse instance,
) => <String, dynamic>{
  'min': instance.min,
  'max': instance.max,
  'exact': instance.exact,
};
