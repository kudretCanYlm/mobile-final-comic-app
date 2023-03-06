import 'package:comic_mobile_app/models/Search/SearchResultModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SearchReducerState.g.dart';

@JsonSerializable()
class SearchReducerState {
  final bool? isSearcing;
  final bool? searced;
  final bool? isError;
  final bool? notfound;
  final List<SearchResultModel>? searches;

  SearchReducerState(
      {this.isSearcing,
      this.searced,
      this.isError,
      this.notfound,
      this.searches});

  factory SearchReducerState.fromJson(Map<String, dynamic> json) =>
      _$SearchReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$SearchReducerStateToJson(this);
}
