// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopReadersReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopReadersReducerState _$TopReadersReducerStateFromJson(
        Map<String, dynamic> json) =>
    TopReadersReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      topReaderList: (json['topReaderList'] as List<dynamic>?)
          ?.map((e) => UserModelA.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopReadersReducerStateToJson(
        TopReadersReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'topReaderList': instance.topReaderList,
    };
