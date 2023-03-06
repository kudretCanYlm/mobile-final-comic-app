import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:comic_mobile_app/redux/actions/User/UserAction.dart';
import 'package:comic_mobile_app/redux/reducers/User/State/UserReducerState.dart';

UserReducerState UserReducer(UserReducerState previousState, dynamic action) {
  switch (action.type) {
    case UserActions.USER_STATE_LOADING:
      return UserReducerState(
        isLoading: true,
        isError: false,
        user: null,
      );
    case UserActions.USER_STATE_ERROR:
      return UserReducerState(
        isLoading: false,
        isError: true,
        user: null,
      );
    case UserActions.USER_STATE:
      return UserReducerState(
        isError: false,
        isLoading: false,
        user: action.user,
      );
    default:
      return previousState;
  }
}
