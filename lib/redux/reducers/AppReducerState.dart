import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/LikedComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/User/UserReducer.dart';

class AppReducerState {
  final AuthReducerState authReducerState;
  final UserReducerState userReducerState;
  final ComicsReducerState comicsReducerState;
  final LikedComicsReducerState likedComicsReducerState;

  AppReducerState(this.authReducerState, this.userReducerState,
      this.comicsReducerState, this.likedComicsReducerState);
}

AppReducerState AppReducer(AppReducerState state, action) {
  return AppReducerState(
      AuthReducer(state.authReducerState, action),
      UserReducer(state.userReducerState, action),
      ComicsReducer(state.comicsReducerState, action),
      LikedComicsReducer(state.likedComicsReducerState, action));
}
