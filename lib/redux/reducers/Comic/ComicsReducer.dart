import 'package:comic_mobile_app/redux/actions/Comic/ComicAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicsReducerState.dart';

ComicsReducerState ComicsReducer(
    ComicsReducerState previousState, dynamic action) {
  switch (action.type) {
    case ComicActions.COMIC_LOADING:
      return ComicsReducerState(
        isLoading: action.isLoading,
        isError: false,
        comics: null,
      );
    case ComicActions.COMIC_ERROR:
      return ComicsReducerState(
          isLoading: false, isError: action.isError, comics: null);
    case ComicActions.COMIC_LOADED:
      return ComicsReducerState(
          isLoading: false, isError: false, comics: action.comics);
    default:
      return previousState;
  }
}
