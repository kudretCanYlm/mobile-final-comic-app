import 'package:comic_mobile_app/redux/actions/Comic/LikedComicAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/LikedComicsReducerState.dart';

LikedComicsReducerState LikedComicsReducer(
    LikedComicsReducerState previousState, dynamic action) {
  switch (action.type) {
    case LikedComicActions.LIKED_COMIC_LOADING:
      return LikedComicsReducerState(
          isLoading: action.isLoading, isError: false, comics: null);
    case LikedComicActions.LIKED_COMIC_ERROR:
      return LikedComicsReducerState(
          isLoading: false, isError: action.isSendError, comics: null);
    case LikedComicActions.LIKED_COMIC_LOADED:
      return LikedComicsReducerState(
          isLoading: false, isError: false, comics: action.comics);
    default:
      return previousState;
  }
}
