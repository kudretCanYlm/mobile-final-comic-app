import 'package:json_annotation/json_annotation.dart';
part 'ComicCharacterModel.g.dart';

@JsonSerializable()
class ComicCharacterModel {
  final String CharacterId;
  final String CharacterName;
  final String CharacterRole;
  final String CharacterResume;
  final String CharacterBase64Image;

  ComicCharacterModel(this.CharacterId, this.CharacterName, this.CharacterRole,
      this.CharacterResume, this.CharacterBase64Image);

  factory ComicCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$ComicCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicCharacterModelToJson(this);
}
