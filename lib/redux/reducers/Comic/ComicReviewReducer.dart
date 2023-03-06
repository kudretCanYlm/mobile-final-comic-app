import 'package:comic_mobile_app/models/Comic/ComicReviewModel.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicReviewAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicReviewReducerState.dart';
import 'package:flutter/cupertino.dart';

ComicReviewReducerState ComicReviewReducer(
    ComicReviewReducerState previousState, dynamic action) {
  switch (action.type) {
    case ComicReviewActions.COMIC_REVIEW_LOADING:
      return ComicReviewReducerState(
        isLoading: action.isLoading,
        comicReviewModel: null,
        isError: null,
      );

    case ComicReviewActions.COMIC_REVIEW_ERROR:
      return ComicReviewReducerState(
        isLoading: null,
        comicReviewModel: null,
        isError: action.isError,
      );
    case ComicReviewActions.COMIC_REVIEW_LOADED:
      return ComicReviewReducerState(
        comicReviewModel: action.comicReview,
        isError: null,
        isLoading: null,
      );
    default:
      return previousState;
  }
}
