import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/addons_options_response.dart';

part 'addons_block_respose.g.dart';

@JsonSerializable()
class AddonBlockResponse {
  final int id;
  @JsonKey(name: "title_ar")
  final String titleAr;
  @JsonKey(name: "title")
  final String titleEn;
  @JsonKey(name: "IsMultiChoise")
  final bool isMultiChoice;
  final List<AddonOptionResponse> options;

  AddonBlockResponse({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.isMultiChoice,
    required this.options,
  });

  factory AddonBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonBlockResponseToJson(this);
}
