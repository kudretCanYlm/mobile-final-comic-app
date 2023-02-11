import 'package:comic_mobile_app/redux/actions/Auth/RegisterAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class RegisterReducerState {
  final bool? isRegistering;
  final bool? isError;
  final String? userId;
  final bool? isRegister;

  RegisterReducerState(
      {this.isRegistering, this.isError, this.userId, this.isRegister});
}

RegisterReducerState RegisterReducer(
    RegisterReducerState previousState, dynamic action) {
  switch (action.type) {
    case RegisterActions.REGISTERING:
      return RegisterReducerState(
        isRegistering: action.isRegistering,
        isError: false,
        userId: null,
        isRegister: false,
      );
    case RegisterActions.REGISTER_ERROR:
      return RegisterReducerState(
        isRegistering: false,
        isError: true,
        userId: null,
        isRegister: false,
      );
    case RegisterActions.REGISTER:
      return RegisterReducerState(
        isRegistering: false,
        isError: false,
        userId: action.userId,
        isRegister: true,
      );
    default:
      return previousState;
  }
}
