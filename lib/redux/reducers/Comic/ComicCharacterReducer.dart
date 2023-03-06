import 'package:comic_mobile_app/redux/actions/Comic/ComicCharacterAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicCharacterReducerState.dart';

ComicCharacterReducerState ComicCharacterReducer(
    ComicCharacterReducerState previousState, dynamic action) {
  switch (action.type) {
    case ComicCharacterActions.COMIC_CHARACTER_LOADING:
      return ComicCharacterReducerState(
        comicCharacterList: null,
        isError: null,
        isLoading: action.isLoading,
      );
    case ComicCharacterActions.COMIC_CHARACTER_ERROR:
      return ComicCharacterReducerState(
        comicCharacterList: null,
        isError: action.isError,
        isLoading: null,
      );
    case ComicCharacterActions.COMIC_CHARACTER_LOADED:
      return ComicCharacterReducerState(
        comicCharacterList: action.comicCharacterList,
        isError: null,
        isLoading: null,
      );
    default:
      return previousState;
  }
}
