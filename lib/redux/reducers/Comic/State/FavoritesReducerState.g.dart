// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FavoritesReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesReducerState _$FavoritesReducerStateFromJson(
        Map<String, dynamic> json) =>
    FavoritesReducerState(
      isLoading: json['isLoading'] as bool?,
      isError: json['isError'] as bool?,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => FavoriteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSending: json['isSending'] as bool?,
      isSendError: json['isSendError'] as bool?,
      isSended: json['isSended'] as bool?,
    );

Map<String, dynamic> _$FavoritesReducerStateToJson(
        FavoritesReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'favorites': instance.favorites,
      'isSending': instance.isSending,
      'isSendError': instance.isSendError,
      'isSended': instance.isSended,
    };
