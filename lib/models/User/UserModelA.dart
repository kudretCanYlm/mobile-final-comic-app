import 'package:json_annotation/json_annotation.dart';

part 'UserModelA.g.dart';

@JsonSerializable()
class UserModelA {
  final String UserId;
  final String Base64Image;
  final String UserName;

  UserModelA(this.UserId, this.Base64Image, this.UserName);

  factory UserModelA.fromJson(Map<String, dynamic> json) =>
      _$UserModelAFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelAToJson(this);
}
