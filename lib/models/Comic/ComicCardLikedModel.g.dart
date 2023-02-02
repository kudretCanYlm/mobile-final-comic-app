// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicCardLikedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicCardLikedModel _$ComicCardLikedModelFromJson(Map<String, dynamic> json) =>
    ComicCardLikedModel(
      json['ComicId'] as String,
      json['ComicName'] as String,
      json['ComicOwner'] as String,
      json['ImageBase64'] as String,
      json['ChapterName'] as String,
      json['Mark'] as String,
    );

Map<String, dynamic> _$ComicCardLikedModelToJson(
        ComicCardLikedModel instance) =>
    <String, dynamic>{
      'ComicId': instance.ComicId,
      'ComicName': instance.ComicName,
      'ComicOwner': instance.ComicOwner,
      'ImageBase64': instance.ImageBase64,
      'ChapterName': instance.ChapterName,
      'Mark': instance.Mark,
    };
