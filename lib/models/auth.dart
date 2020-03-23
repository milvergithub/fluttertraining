import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth.g.dart';

@JsonSerializable()
class Credentials {
  final String token;
  final String fullName;
  final String email;

  Credentials({@required this.token, @required this.fullName, @required this.email});

  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialsToJson(this);
}