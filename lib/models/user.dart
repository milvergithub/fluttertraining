import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "login")
  String login;

  @JsonKey(name: "avatar_url")
  String avatar;

  @JsonKey(name: "url")
  String url;

  User();
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}