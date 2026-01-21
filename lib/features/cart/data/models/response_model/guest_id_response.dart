import 'package:json_annotation/json_annotation.dart';
part 'guest_id_response.g.dart';

@JsonSerializable()
class GuestIdResponse {
  @JsonKey(name: "guest_id")
  final String guestId;

  GuestIdResponse({required this.guestId});

  factory GuestIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GuestIdResponseToJson(this);
}
