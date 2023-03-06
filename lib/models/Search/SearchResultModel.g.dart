// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      $enumDecode(_$SearchResultTypesEnumMap, json['ResultType']),
      json['Id'] as String,
      json['Base64Image'] as String,
      json['Name'] as String,
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'ResultType': _$SearchResultTypesEnumMap[instance.ResultType]!,
      'Id': instance.Id,
      'Base64Image': instance.Base64Image,
      'Name': instance.Name,
    };

const _$SearchResultTypesEnumMap = {
  SearchResultTypes.User: 'User',
  SearchResultTypes.Comic: 'Comic',
};
