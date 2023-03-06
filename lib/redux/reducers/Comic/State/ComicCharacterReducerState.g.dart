// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicCharacterReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicCharacterReducerState _$ComicCharacterReducerStateFromJson(
        Map<String, dynamic> json) =>
    ComicCharacterReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      comicCharacterList: (json['comicCharacterList'] as List<dynamic>?)
          ?.map((e) => ComicCharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicCharacterReducerStateToJson(
        ComicCharacterReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'comicCharacterList': instance.comicCharacterList,
    };
