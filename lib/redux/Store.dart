import 'package:comic_mobile_app/redux/middleware/Middleware.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/AuthReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/ProfileDetailsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/RegisterReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicCharacterReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicDataReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicReviewReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicStatisticsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/FavoritesReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/LikedComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/TopComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Page/State/MainPageIndexReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Search/State/SearchReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/User/State/UserReducerState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

import 'reducers/User/State/TopReadersReducerState.dart';

Future<Store<AppReducerState>> createStore() async {
  AppReducerState? initialState;
  try {
    initialState = await persistor.load();
  } catch (e) {
    initialState = null;
  }

  // ignore: unnecessary_new
  Store<AppReducerState> store = new Store(
    AppReducer,
    initialState: AppReducerState(
        authReducerState: initialState?.authReducerState ?? AuthReducerState(),
        profileDetailsReducerState: ProfileDetailsReducerState(),
        registerReducerState: RegisterReducerState(),
        topReadersReducerState: TopReadersReducerState(),
        userReducerState: UserReducerState(),
        comicCharacterReducerState: ComicCharacterReducerState(),
        comicDataReducerState:
            initialState?.comicDataReducerState ?? ComicDataReducerState([]),
        comicReviewReducerState: ComicReviewReducerState(),
        comicStatisticsReducerState: ComicStatisticsReducerState(),
        comicsReducerState: ComicsReducerState(),
        likedComicsReducerState: LikedComicsReducerState(),
        topComicsReducerState: TopComicsReducerState(),
        favoritesReducerState: FavoritesReducerState(),
        mainPageIndexReducerState: MainPageIndexReducerState(index: 1),
        searchReducerState: SearchReducerState()),
    middleware: [
      thunkMiddleware,
      persistor.createMiddleware(),
      new LoggingMiddleware.printer(),
    ],
  );

  return store;
}
