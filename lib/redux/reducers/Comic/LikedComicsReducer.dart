import 'package:comic_mobile_app/models/Comic/ComicCardLikedModel.dart';
import 'package:comic_mobile_app/redux/actions/Comic/LikedComicAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class LikedComicsReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<ComicCardLikedModel>? comics;

  LikedComicsReducerState({this.isLoading, this.isError, this.comics});
}

LikedComicsReducerState LikedComicsReducer(
    LikedComicsReducerState previousState, dynamic action) {
  switch (action.type) {
    case LikedComicActions.LIKED_COMIC_LOADING:
      return LikedComicsReducerState(
          isLoading: action.isLoading, isError: false, comics: null);
    case LikedComicActions.LIKED_COMIC_ERROR:
      return LikedComicsReducerState(
          isLoading: false, isError: action.isError, comics: null);
    case LikedComicActions.LIKED_COMIC_LOADED:
      return LikedComicsReducerState(
          isLoading: false, isError: false, comics: action.comics);
    default:
      return previousState;
  }
}
