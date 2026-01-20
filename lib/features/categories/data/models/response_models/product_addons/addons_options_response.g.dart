// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonOptionResponse _$AddonOptionResponseFromJson(Map<String, dynamic> json) =>
    AddonOptionResponse(
      id: (json['id'] as num).toInt(),
      labelAr: json['label_ar'] as String,
      label: json['label'] as String,
      selectedByDefault: json['selected_by_default'] as bool,
    );

Map<String, dynamic> _$AddonOptionResponseToJson(
  AddonOptionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'label_ar': instance.labelAr,
  'label': instance.label,
  'selected_by_default': instance.selectedByDefault,
};
