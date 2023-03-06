import 'package:json_annotation/json_annotation.dart';

part 'UserModelB.g.dart';

@JsonSerializable()
class UserModelB {
  final String Base64Image;
  final String UserName;
  final String RealName;

  UserModelB(this.Base64Image, this.UserName, this.RealName);

  factory UserModelB.fromJson(Map<String, dynamic> json) =>
      _$UserModelBFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelBToJson(this);
}
