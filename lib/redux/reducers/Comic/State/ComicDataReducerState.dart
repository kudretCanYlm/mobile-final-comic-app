import 'package:comic_mobile_app/models/Comic/ComicDataModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ComicDataReducerState.g.dart';

@JsonSerializable()
class ComicDataReducerState {
  final List<ComicDataModel> comicData;

  ComicDataReducerState(this.comicData);

  factory ComicDataReducerState.fromJson(Map<String, dynamic> json) =>
      _$ComicDataReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicDataReducerStateToJson(this);
}
