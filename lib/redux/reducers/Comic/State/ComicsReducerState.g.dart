// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicsReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsReducerState _$ComicsReducerStateFromJson(Map<String, dynamic> json) =>
    ComicsReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      comics: (json['comics'] as List<dynamic>?)
          ?.map((e) => ComicCardModelA.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsReducerStateToJson(ComicsReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'comics': instance.comics,
    };
