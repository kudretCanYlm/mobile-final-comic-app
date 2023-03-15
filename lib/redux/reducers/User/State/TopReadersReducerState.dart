import 'package:comic_mobile_app/models/User/UserModelA.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TopReadersReducerState.g.dart';

@JsonSerializable()
class TopReadersReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<UserModelA>? topReaderList;

  TopReadersReducerState({
    this.isLoading,
    this.isError,
    this.topReaderList,
  });

  factory TopReadersReducerState.fromJson(Map<String, dynamic> json) =>
      _$TopReadersReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$TopReadersReducerStateToJson(this);
}
