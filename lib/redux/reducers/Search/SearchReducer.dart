import 'package:comic_mobile_app/models/Search/SearchResultModel.dart';
import 'package:comic_mobile_app/redux/actions/Search/SearchAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SearchReducerState {
  final bool? isSearcing;
  final bool? searced;
  final bool? isError;
  final bool? notfound;
  final List<SearchResultModel>? searches;

  SearchReducerState(
      {this.isSearcing,
      this.searced,
      this.isError,
      this.notfound,
      this.searches});
}

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
        isError: action.isError,
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
