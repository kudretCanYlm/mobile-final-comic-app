// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicDataReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicDataReducerState _$ComicDataReducerStateFromJson(
        Map<String, dynamic> json) =>
    ComicDataReducerState(
      (json['comicData'] as List<dynamic>)
          .map((e) => ComicDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicDataReducerStateToJson(
        ComicDataReducerState instance) =>
    <String, dynamic>{
      'comicData': instance.comicData,
    };
