import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/addons_options_response.dart';

part 'addons_response.g.dart';

@JsonSerializable()
class AddonResponse {
  final int id;
  @JsonKey(name: "title")
  final String titleEn;
  @JsonKey(name: "title_ar")
  final String titleAr;
  final List<AddonOptionResponse> options;
  AddonResponse({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.options,
  });
  factory AddonResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddonResponseToJson(this);
}
