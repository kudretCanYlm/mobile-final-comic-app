// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterReducerState _$RegisterReducerStateFromJson(
        Map<String, dynamic> json) =>
    RegisterReducerState(
      isRegistering: json['isRegistering'] as bool?,
      isError: json['isError'] as bool?,
      userId: json['userId'] as String?,
      isRegister: json['isRegister'] as bool?,
    );

Map<String, dynamic> _$RegisterReducerStateToJson(
        RegisterReducerState instance) =>
    <String, dynamic>{
      'isRegistering': instance.isRegistering,
      'isError': instance.isError,
      'userId': instance.userId,
      'isRegister': instance.isRegister,
    };
