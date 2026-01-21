// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonOptionResponse _$AddonOptionResponseFromJson(Map<String, dynamic> json) =>
    AddonOptionResponse(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      labelAr: json['label_ar'] as String,
      selectedByDefault: json['selected_by_default'] as bool,
    );

Map<String, dynamic> _$AddonOptionResponseToJson(
  AddonOptionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'label_ar': instance.labelAr,
  'selected_by_default': instance.selectedByDefault,
};
