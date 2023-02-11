import 'package:comic_mobile_app/redux/middleware/Middleware.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/RegisterReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/FavoritesReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/LikedComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Page/MainPageIndexReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Search/SearchReducer.dart';
import 'package:comic_mobile_app/redux/reducers/User/UserReducer.dart';
import 'package:redux/redux.dart';

Store<AppReducerState> createStore() {
  // ignore: unnecessary_new
  Store<AppReducerState> store = new Store(
    AppReducer,
    initialState: AppReducerState(
        AuthReducerState(true, false, "", false),
        RegisterReducerState(),
        UserReducerState(),
        ComicsReducerState(),
        LikedComicsReducerState(),
        FavoritesReducerState(),
        MainPageIndexReducerState(index: 1),
        SearchReducerState()),
    middleware: createMiddleware(),
  );
  //persistor.start(store);

  return store;
}
