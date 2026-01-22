// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addons_block_respose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonBlockResponse _$AddonBlockResponseFromJson(Map<String, dynamic> json) =>
    AddonBlockResponse(
      id: int.parse(json['id'] as String),
      name: json['name'] as String,
      addons: (json['addons'] as List<dynamic>)
          .map((e) => AddonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonBlockResponseToJson(AddonBlockResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'addons': instance.addons,
    };
