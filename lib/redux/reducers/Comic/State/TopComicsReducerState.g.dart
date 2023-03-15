// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopComicsReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopComicsReducerState _$TopComicsReducerStateFromJson(
        Map<String, dynamic> json) =>
    TopComicsReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      topComicList: (json['topComicList'] as List<dynamic>?)
          ?.map((e) => ComicModelA.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopComicsReducerStateToJson(
        TopComicsReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'topComicList': instance.topComicList,
    };
