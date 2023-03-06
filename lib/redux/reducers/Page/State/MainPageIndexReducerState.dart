import 'package:json_annotation/json_annotation.dart';

part 'MainPageIndexReducerState.g.dart';

@JsonSerializable()
class MainPageIndexReducerState {
  final int? index;
  MainPageIndexReducerState({this.index});

  factory MainPageIndexReducerState.fromJson(Map<String, dynamic> json) =>
      _$MainPageIndexReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$MainPageIndexReducerStateToJson(this);
}
