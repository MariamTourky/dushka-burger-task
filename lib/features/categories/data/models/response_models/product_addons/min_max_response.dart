import 'package:json_annotation/json_annotation.dart';

part 'min_max_response.g.dart';

@JsonSerializable()
class MinMaxRulesResponse {
  @JsonKey(name: "min")
  final int? min;
  @JsonKey(name: "max")
  final int? max;
  @JsonKey(name: "exact")
  final int? exact;

  MinMaxRulesResponse({this.min, this.max, this.exact});

  factory MinMaxRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$MinMaxRulesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MinMaxRulesResponseToJson(this);
}
