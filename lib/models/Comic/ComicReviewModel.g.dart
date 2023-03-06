// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicReviewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicReviewModel _$ComicReviewModelFromJson(Map<String, dynamic> json) =>
    ComicReviewModel(
      json['ComicId'] as String,
      json['Base64BackImage'] as String,
      json['ComicName'] as String,
      json['ComicOwner'] as String,
      json['ComicResume'] as String,
    );

Map<String, dynamic> _$ComicReviewModelToJson(ComicReviewModel instance) =>
    <String, dynamic>{
      'ComicId': instance.ComicId,
      'Base64BackImage': instance.Base64BackImage,
      'ComicName': instance.ComicName,
      'ComicResume': instance.ComicResume,
      'ComicOwner': instance.ComicOwner,
    };
