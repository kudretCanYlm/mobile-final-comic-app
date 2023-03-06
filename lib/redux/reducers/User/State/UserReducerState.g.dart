// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReducerState _$UserReducerStateFromJson(Map<String, dynamic> json) =>
    UserReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      user: json['user'] == null
          ? null
          : UserModelB.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserReducerStateToJson(UserReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'user': instance.user,
    };
