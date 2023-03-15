import 'dart:convert';

import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/ProfileDetailsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/RegisterReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/AuthReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/ProfileDetailsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/RegisterReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicCharacterReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicDataReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicReviewReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicStatisticsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/ComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/FavoritesReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/LikedComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicCharacterReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicDataReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicReviewReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicStatisticsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/FavoritesReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/LikedComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/TopComicsReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/TopComicsReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Page/MainPageIndexReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Page/State/MainPageIndexReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Search/SearchReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Search/State/SearchReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/User/State/TopReadersReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/User/State/UserReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/User/TopReadersReducer.dart';
import 'package:comic_mobile_app/redux/reducers/User/UserReducer.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AppReducerState {
  final AuthReducerState? authReducerState;
  final ProfileDetailsReducerState? profileDetailsReducerState;
  final RegisterReducerState? registerReducerState;
  final TopReadersReducerState? topReadersReducerState;
  final UserReducerState? userReducerState;
  final ComicCharacterReducerState? comicCharacterReducerState;
  final ComicDataReducerState? comicDataReducerState;
  final ComicReviewReducerState? comicReviewReducerState;
  final ComicStatisticsReducerState? comicStatisticsReducerState;
  final ComicsReducerState? comicsReducerState;
  final LikedComicsReducerState? likedComicsReducerState;
  final TopComicsReducerState? topComicsReducerState;
  final FavoritesReducerState? favoritesReducerState;
  final MainPageIndexReducerState? mainPageIndexReducerState;
  final SearchReducerState? searchReducerState;

  AppReducerState(
      {this.authReducerState,
      this.profileDetailsReducerState,
      this.registerReducerState,
      this.topReadersReducerState,
      this.userReducerState,
      this.comicCharacterReducerState,
      this.comicDataReducerState,
      this.comicReviewReducerState,
      this.comicStatisticsReducerState,
      this.comicsReducerState,
      this.likedComicsReducerState,
      this.topComicsReducerState,
      this.favoritesReducerState,
      this.mainPageIndexReducerState,
      this.searchReducerState});

  static AppReducerState fromJson(dynamic json) {
    return AppReducerState(
        authReducerState: AuthReducerState.fromJson(json["authReducerState"]),
        comicDataReducerState:
            ComicDataReducerState.fromJson(json["comicDataReducerState"]));
  }

  dynamic toJson() => {
        'authReducerState': authReducerState!.toJson(),
        'comicDataReducerState': comicDataReducerState?.toJson(),
      };
}

AppReducerState AppReducer(AppReducerState state, action) {
  return AppReducerState(
    authReducerState: AuthReducer(state.authReducerState!, action),
    profileDetailsReducerState:
        ProfileDetailsReducer(state.profileDetailsReducerState!, action),
    registerReducerState: RegisterReducer(state.registerReducerState!, action),
    topReadersReducerState:
        TopReadersReducer(state.topReadersReducerState!, action),
    userReducerState: UserReducer(state.userReducerState!, action),
    comicCharacterReducerState:
        ComicCharacterReducer(state.comicCharacterReducerState!, action),
    comicDataReducerState:
        ComicDataReducer(state.comicDataReducerState!, action),
    comicReviewReducerState:
        ComicReviewReducer(state.comicReviewReducerState!, action),
    comicStatisticsReducerState:
        ComicStatisticsReducer(state.comicStatisticsReducerState!, action),
    comicsReducerState: ComicsReducer(state.comicsReducerState!, action),
    likedComicsReducerState:
        LikedComicsReducer(state.likedComicsReducerState!, action),
    topComicsReducerState:
        TopComicsReducer(state.topComicsReducerState!, action),
    favoritesReducerState:
        FavoritesReducer(state.favoritesReducerState!, action),
    mainPageIndexReducerState:
        MainPageIndexReducer(state.mainPageIndexReducerState!, action),
    searchReducerState: SearchReducer(state.searchReducerState!, action),
  );
}
