import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/LikedComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Page/MainPageIndexReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Search/SearchReducer.dart';
import 'package:comic_mobile_app/redux/reducers/User/UserReducer.dart';

class AppReducerState {
  final AuthReducerState authReducerState;
  final UserReducerState userReducerState;
  final ComicsReducerState comicsReducerState;
  final LikedComicsReducerState likedComicsReducerState;
  final MainPageIndexReducerState mainPageIndexReducerState;
  final SearchReducerState searchReducerState;

  AppReducerState(
      this.authReducerState,
      this.userReducerState,
      this.comicsReducerState,
      this.likedComicsReducerState,
      this.mainPageIndexReducerState,
      this.searchReducerState);
}

AppReducerState AppReducer(AppReducerState state, action) {
  return AppReducerState(
    AuthReducer(state.authReducerState, action),
    UserReducer(state.userReducerState, action),
    ComicsReducer(state.comicsReducerState, action),
    LikedComicsReducer(state.likedComicsReducerState, action),
    MainPageIndexReducer(state.mainPageIndexReducerState, action),
    SearchReducer(state.searchReducerState, action),
  );
}
