import 'package:comic_mobile_app/redux/actions/Auth/AuthAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AuthReducerState {
  final bool isLogining;
  final bool isError;
  final String userId;
  final bool isLogin;

  AuthReducerState(
    this.isLogining,
    this.isError,
    this.userId,
    this.isLogin,
  );
}

AuthReducerState AuthReducer(AuthReducerState previousState, dynamic action) {
  switch (action.type) {
    case AuthActions.LOGIN:
      return AuthReducerState(false, false, action.userId, action.isLogin);
    case AuthActions.LOGINERROR:
      return AuthReducerState(false, true, "", false);
    // case AuthActions.LOGINING:
    //   break;
    // case AuthActions.LOGOUT:
    //   break;
    // case AuthActions.USER_LOGIN_INFO:
    //   break;
    // case AuthActions.USER_LOGIN_STATE:
    //   break;

    default:
      return previousState;
  }
}
