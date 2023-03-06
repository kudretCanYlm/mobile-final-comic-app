// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileDetailsReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailsReducerState _$ProfileDetailsReducerStateFromJson(
        Map<String, dynamic> json) =>
    ProfileDetailsReducerState(
      isSending: json['isSending'] as bool?,
      isError: json['isError'] as bool?,
      isSended: json['isSended'] as bool?,
    );

Map<String, dynamic> _$ProfileDetailsReducerStateToJson(
        ProfileDetailsReducerState instance) =>
    <String, dynamic>{
      'isSending': instance.isSending,
      'isError': instance.isError,
      'isSended': instance.isSended,
    };
