// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicCardModelA.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicCardModelA _$ComicCardModelAFromJson(Map<String, dynamic> json) =>
    ComicCardModelA(
      json['ComicId'] as String,
      json['ComicName'] as String,
      json['ImageBase64'] as String,
      json['ComicOwner'] as String,
    );

Map<String, dynamic> _$ComicCardModelAToJson(ComicCardModelA instance) =>
    <String, dynamic>{
      'ComicId': instance.ComicId,
      'ComicName': instance.ComicName,
      'ImageBase64': instance.ImageBase64,
      'ComicOwner': instance.ComicOwner,
    };
