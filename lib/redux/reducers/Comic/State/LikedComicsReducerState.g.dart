// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LikedComicsReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikedComicsReducerState _$LikedComicsReducerStateFromJson(
        Map<String, dynamic> json) =>
    LikedComicsReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      comics: (json['comics'] as List<dynamic>?)
          ?.map((e) => ComicCardLikedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LikedComicsReducerStateToJson(
        LikedComicsReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'comics': instance.comics,
    };
