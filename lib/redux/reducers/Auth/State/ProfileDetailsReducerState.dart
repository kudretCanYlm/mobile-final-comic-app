import 'package:json_annotation/json_annotation.dart';

part 'ProfileDetailsReducerState.g.dart';

@JsonSerializable()
class ProfileDetailsReducerState {
  final bool? isSending;
  final bool? isError;
  final bool? isSended;

  ProfileDetailsReducerState({this.isSending, this.isError, this.isSended});

  factory ProfileDetailsReducerState.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailsReducerStateToJson(this);
}
