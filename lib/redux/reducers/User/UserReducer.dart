import 'package:comic_mobile_app/models/User/UserModels.dart';
import 'package:comic_mobile_app/redux/actions/User/UserAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class UserReducerState {
  final bool? isLoading;
  final bool? isError;
  final UserModelB? user;

  UserReducerState({this.isLoading, this.isError, this.user});
}

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
