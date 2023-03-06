// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicStatisticsReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicStatisticsReducerState _$ComicStatisticsReducerStateFromJson(
        Map<String, dynamic> json) =>
    ComicStatisticsReducerState(
      isLoading: json['isLoading'] as bool? ?? true,
      isError: json['isError'] as bool? ?? false,
      comicStatisticsModel: json['comicStatisticsModel'] == null
          ? null
          : ComicStatisticsModel.fromJson(
              json['comicStatisticsModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicStatisticsReducerStateToJson(
        ComicStatisticsReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'comicStatisticsModel': instance.comicStatisticsModel,
    };
