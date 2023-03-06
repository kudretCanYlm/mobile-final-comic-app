import 'package:json_annotation/json_annotation.dart';
part 'AuthReducerState.g.dart';

@JsonSerializable()
class AuthReducerState {
  final bool? isLogining;
  final bool? isError;
  final String? userId;
  final bool? isLogin;

  AuthReducerState({
    this.isLogining,
    this.isError,
    this.userId,
    this.isLogin,
  });

  factory AuthReducerState.fromJson(dynamic json) =>
      _$AuthReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthReducerStateToJson(this);
}
