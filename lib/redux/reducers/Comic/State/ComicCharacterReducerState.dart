import 'package:comic_mobile_app/models/Comic/ComicCharacterModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ComicCharacterReducerState.g.dart';

@JsonSerializable()
class ComicCharacterReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<ComicCharacterModel>? comicCharacterList;

  ComicCharacterReducerState(
      {this.isLoading, this.isError, this.comicCharacterList});

  factory ComicCharacterReducerState.fromJson(Map<String, dynamic> json) =>
      _$ComicCharacterReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicCharacterReducerStateToJson(this);
}
