import 'package:comic_mobile_app/models/Comic/ComicStatisticsModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ComicStatisticsReducerState.g.dart';

@JsonSerializable()
class ComicStatisticsReducerState {
  final bool? isLoading;
  final bool? isError;
  final ComicStatisticsModel? comicStatisticsModel;

  ComicStatisticsReducerState(
      {this.isLoading = true, this.isError = false, this.comicStatisticsModel});

  factory ComicStatisticsReducerState.fromJson(Map<String, dynamic> json) =>
      _$ComicStatisticsReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicStatisticsReducerStateToJson(this);
}
