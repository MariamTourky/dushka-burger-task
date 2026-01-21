import 'package:json_annotation/json_annotation.dart';

part 'addons_options_response.g.dart';

@JsonSerializable()
class AddonOptionResponse {
  final String label;

  @JsonKey(name: "label_ar")
  final String labelAr;

  @JsonKey(name: "selected_by_default")
  final bool selectedByDefault;

  AddonOptionResponse({
    required this.label,
    required this.labelAr,
    required this.selectedByDefault,
  });

  factory AddonOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonOptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddonOptionResponseToJson(this);
}
