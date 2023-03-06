import 'package:comic_mobile_app/models/Comic/ComicCardModelA.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ComicsReducerState.g.dart';

@JsonSerializable()
class ComicsReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<ComicCardModelA>? comics;

  ComicsReducerState({this.isLoading, this.isError, this.comics});

  factory ComicsReducerState.fromJson(Map<String, dynamic> json) =>
      _$ComicsReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsReducerStateToJson(this);
}
