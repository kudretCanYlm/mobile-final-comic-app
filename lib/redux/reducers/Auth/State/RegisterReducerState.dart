import 'package:json_annotation/json_annotation.dart';

part 'RegisterReducerState.g.dart';

@JsonSerializable()
class RegisterReducerState {
  final bool? isRegistering;
  final bool? isError;
  final String? userId;
  final bool? isRegister;

  RegisterReducerState(
      {this.isRegistering, this.isError, this.userId, this.isRegister});

  factory RegisterReducerState.fromJson(Map<String, dynamic> json) =>
      _$RegisterReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterReducerStateToJson(this);
}
