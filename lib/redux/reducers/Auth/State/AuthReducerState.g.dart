// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthReducerState _$AuthReducerStateFromJson(Map<String, dynamic> json) =>
    AuthReducerState(
      isLogining: json['isLogining'] as bool?,
      isError: json['isError'] as bool?,
      userId: json['userId'] as String?,
      isLogin: json['isLogin'] as bool?,
    );

Map<String, dynamic> _$AuthReducerStateToJson(AuthReducerState instance) =>
    <String, dynamic>{
      'isLogining': instance.isLogining,
      'isError': instance.isError,
      'userId': instance.userId,
      'isLogin': instance.isLogin,
    };
