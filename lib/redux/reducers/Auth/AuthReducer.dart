import 'package:comic_mobile_app/redux/actions/Auth/AuthAction.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/AuthReducerState.dart';

AuthReducerState AuthReducer(AuthReducerState previousState, dynamic action) {
  switch (action.type) {
    case AuthActions.LOGIN:
      return AuthReducerState(
          isLogining: false,
          isError: false,
          userId: action.userId,
          isLogin: action.isLogin);
    case AuthActions.LOGINERROR:
      return AuthReducerState(
          isLogining: false, isError: true, userId: "", isLogin: false);
    // case AuthActions.LOGINING:
    //   break;
    case AuthActions.LOGOUT:
      return AuthReducerState(
        isLogining: false,
        isError: false,
        userId: null,
        isLogin: false,
      );
    // case AuthActions.USER_LOGIN_INFO:
    //   break;
    // case AuthActions.USER_LOGIN_STATE:
    //   break;

    default:
      return previousState;
  }
}
