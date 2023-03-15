import 'package:comic_mobile_app/models/Comic/ComicModelA.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TopComicsReducerState.g.dart';

@JsonSerializable()
class TopComicsReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<ComicModelA>? topComicList;

  TopComicsReducerState({
    this.isLoading,
    this.isError,
    this.topComicList,
  });

  factory TopComicsReducerState.fromJson(Map<String, dynamic> json) =>
      _$TopComicsReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$TopComicsReducerStateToJson(this);
}
