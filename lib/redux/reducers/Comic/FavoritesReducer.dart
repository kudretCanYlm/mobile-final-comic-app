import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:comic_mobile_app/redux/actions/Comic/FavoriteAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/FavoritesReducerState.dart';
import 'package:flutter/cupertino.dart';

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
    case FavoriteActions.FAVORITE_SENDING:
      return FavoritesReducerState(
        isSending: action.isSending,
        isSendError: false,
        isSended: false,
      );
    case FavoriteActions.FAVORITE_SENDING_ERROR:
      return FavoritesReducerState(
        isSending: false,
        isSendError: true,
        isSended: false,
      );
    case FavoriteActions.FAVORITE_SENDED:
      return FavoritesReducerState(
        isSending: false,
        isSendError: false,
        isSended: true,
      );

    default:
      return previousState;
  }
}
