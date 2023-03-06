// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicStatisticsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicStatisticsModel _$ComicStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    ComicStatisticsModel(
      json['Rating'] as String,
      json['Chapter'] as String,
      json['Language'] as String,
    );

Map<String, dynamic> _$ComicStatisticsModelToJson(
        ComicStatisticsModel instance) =>
    <String, dynamic>{
      'Rating': instance.Rating,
      'Chapter': instance.Chapter,
      'Language': instance.Language,
    };
