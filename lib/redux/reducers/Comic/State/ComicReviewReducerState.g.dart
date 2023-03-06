// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComicReviewReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicReviewReducerState _$ComicReviewReducerStateFromJson(
        Map<String, dynamic> json) =>
    ComicReviewReducerState(
      isLoading: json['isLoading'] as bool? ?? true,
      isError: json['isError'] as bool? ?? false,
      comicReviewModel: json['comicReviewModel'] == null
          ? null
          : ComicReviewModel.fromJson(
              json['comicReviewModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicReviewReducerStateToJson(
        ComicReviewReducerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'comicReviewModel': instance.comicReviewModel,
    };
