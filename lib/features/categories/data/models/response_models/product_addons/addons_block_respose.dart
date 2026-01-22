import 'package:json_annotation/json_annotation.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/addons_response.dart';

part 'addons_block_respose.g.dart';

@JsonSerializable()
class AddonBlockResponse {
  @JsonKey(fromJson: int.parse)
  final int id;

  @JsonKey(name: "name")
  final String name;

  final List<AddonResponse> addons;

  AddonBlockResponse({
    required this.id,
    required this.name,
    required this.addons,
  });

  factory AddonBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonBlockResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddonBlockResponseToJson(this);
}
