// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchReducerState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchReducerState _$SearchReducerStateFromJson(Map<String, dynamic> json) =>
    SearchReducerState(
      isSearcing: json['isSearcing'] as bool?,
      searced: json['searced'] as bool?,
      isError: json['isError'] as bool?,
      notfound: json['notfound'] as bool?,
      searches: (json['searches'] as List<dynamic>?)
          ?.map((e) => SearchResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchReducerStateToJson(SearchReducerState instance) =>
    <String, dynamic>{
      'isSearcing': instance.isSearcing,
      'searced': instance.searced,
      'isError': instance.isError,
      'notfound': instance.notfound,
      'searches': instance.searches,
    };
