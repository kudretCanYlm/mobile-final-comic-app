import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserReducerState.g.dart';

@JsonSerializable()
class UserReducerState {
  final bool? isLoading;
  final bool? isError;
  final UserModelB? user;

  UserReducerState({this.isLoading, this.isError, this.user});

  factory UserReducerState.fromJson(Map<String, dynamic> json) =>
      _$UserReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserReducerStateToJson(this);
}
