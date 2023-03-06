import 'package:comic_mobile_app/redux/actions/Search/SearchAction.dart';
import 'package:comic_mobile_app/redux/reducers/Search/State/SearchReducerState.dart';

SearchReducerState SearchReducer(
    SearchReducerState previousState, dynamic action) {
  switch (action.type) {
    case SearchActions.SEARCHING:
      return SearchReducerState(
        isError: false,
        isSearcing: action.isSearcing,
        searced: false,
        notfound: false,
        searches: null,
      );
    case SearchActions.SEARCH_ERROR:
      return SearchReducerState(
        isError: action.isSendError,
        isSearcing: false,
        searced: false,
        notfound: false,
        searches: null,
      );
    case SearchActions.SEARCHED:
      return SearchReducerState(
          isError: false,
          isSearcing: false,
          searced: true,
          notfound: false,
          searches: action.searches);
    case SearchActions.SEARCHED_NOT_FOUND:
      return SearchReducerState(
          isError: false,
          isSearcing: false,
          searced: false,
          notfound: action.notfound,
          searches: null);
    case SearchActions.READY_SEARCH:
      return SearchReducerState(
          isError: false,
          isSearcing: false,
          searced: false,
          notfound: false,
          searches: null);
    default:
      return previousState;
  }
}
