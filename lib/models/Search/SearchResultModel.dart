import 'package:comic_mobile_app/models/Search/common/SearchResultTypes.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SearchResultModel.g.dart';

@JsonSerializable()
class SearchResultModel {
  final SearchResultTypes ResultType;
  final String Id;
  final String Base64Image;
  final String Name;

  SearchResultModel(this.ResultType, this.Id, this.Base64Image, this.Name);

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}
