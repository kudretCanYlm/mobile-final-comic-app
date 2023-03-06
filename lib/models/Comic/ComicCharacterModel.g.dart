// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicCharacterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicCharacterModel _$ComicCharacterModelFromJson(Map<String, dynamic> json) =>
    ComicCharacterModel(
      json['CharacterId'] as String,
      json['CharacterName'] as String,
      json['CharacterRole'] as String,
      json['CharacterResume'] as String,
      json['CharacterBase64Image'] as String,
    );

Map<String, dynamic> _$ComicCharacterModelToJson(
        ComicCharacterModel instance) =>
    <String, dynamic>{
      'CharacterId': instance.CharacterId,
      'CharacterName': instance.CharacterName,
      'CharacterRole': instance.CharacterRole,
      'CharacterResume': instance.CharacterResume,
      'CharacterBase64Image': instance.CharacterBase64Image,
    };
