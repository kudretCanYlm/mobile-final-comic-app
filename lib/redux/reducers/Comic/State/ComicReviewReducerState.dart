import 'package:comic_mobile_app/models/Comic/ComicReviewModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ComicReviewReducerState.g.dart';

@JsonSerializable()
class ComicReviewReducerState {
  final bool? isLoading;
  final bool? isError;
  final ComicReviewModel? comicReviewModel;

  ComicReviewReducerState(
      {this.isLoading = true, this.isError = false, this.comicReviewModel});

  factory ComicReviewReducerState.fromJson(Map<String, dynamic> json) =>
      _$ComicReviewReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicReviewReducerStateToJson(this);
}
