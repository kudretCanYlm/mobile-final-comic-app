import 'package:comic_mobile_app/models/Comic/ComicCardLikedModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'LikedComicsReducerState.g.dart';

@JsonSerializable()
class LikedComicsReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<ComicCardLikedModel>? comics;

  LikedComicsReducerState({this.isLoading, this.isError, this.comics});

  factory LikedComicsReducerState.fromJson(Map<String, dynamic> json) =>
      _$LikedComicsReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$LikedComicsReducerStateToJson(this);
}
