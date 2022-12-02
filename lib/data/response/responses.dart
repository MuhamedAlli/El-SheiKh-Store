import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "token")
  String? token;
  LoginResponse(this.token);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
