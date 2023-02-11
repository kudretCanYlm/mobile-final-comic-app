import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:comic_mobile_app/redux/actions/Comic/FavoriteAction.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FavoritesReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<FavoriteModel>? favorites;

  FavoritesReducerState({this.isLoading, this.isError, this.favorites});
}

FavoritesReducerState FavoritesReducer(
    FavoritesReducerState previousState, dynamic action) {
  switch (action.type) {
    case FavoriteActions.FAVORITE_LOADING:
      return FavoritesReducerState(
        isLoading: action.isLoading,
        isError: false,
        favorites: null,
      );
    case FavoriteActions.FAVORITE_ERROR:
      return FavoritesReducerState(
        isLoading: false,
        isError: action.isError,
        favorites: null,
      );
    case FavoriteActions.FAVORITE_LOADED:
      return FavoritesReducerState(
        isLoading: false,
        isError: false,
        favorites: action.favorites,
      );
    default:
      return previousState;
  }
}
