import 'package:comic_mobile_app/redux/actions/Comic/TopComicsAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/TopComicsReducerState.dart';

TopComicsReducerState TopComicsReducer(
    TopComicsReducerState previousState, dynamic action) {
  switch (action.type) {
    case TopComicsActions.TOP_COMICS_LOADING:
      return TopComicsReducerState(
        isLoading: action.isLoading,
        isError: null,
        topComicList: null,
      );
    case TopComicsActions.TOP_COMICS_ERROR:
      return TopComicsReducerState(
        isLoading: null,
        isError: action.isError,
        topComicList: null,
      );

    case TopComicsActions.TOP_COMICS:
      return TopComicsReducerState(
        isLoading: null,
        isError: null,
        topComicList: action.topComicList,
      );

    default:
      return previousState;
  }
}
