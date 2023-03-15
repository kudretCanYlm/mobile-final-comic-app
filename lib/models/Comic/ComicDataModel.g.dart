// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicDataModel _$ComicDataModelFromJson(Map<String, dynamic> json) =>
    ComicDataModel(
      json['ComicId'] as String,
      json['TotalData'] as int,
    )
      ..IsDownload = json['IsDownload'] as bool
      ..IsSaving = json['IsSaving'] as bool?
      ..IsSaved = json['IsSaved'] as bool?;

Map<String, dynamic> _$ComicDataModelToJson(ComicDataModel instance) =>
    <String, dynamic>{
      'ComicId': instance.ComicId,
      'TotalData': instance.TotalData,
      'IsDownload': instance.IsDownload,
      'IsSaving': instance.IsSaving,
      'IsSaved': instance.IsSaved,
    };
