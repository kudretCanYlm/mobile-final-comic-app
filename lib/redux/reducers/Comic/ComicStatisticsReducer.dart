import 'package:comic_mobile_app/redux/actions/Comic/ComicStatisticsAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicStatisticsReducerState.dart';

ComicStatisticsReducerState ComicStatisticsReducer(
    ComicStatisticsReducerState previousState, dynamic action) {
  switch (action.type) {
    case ComicStatisticsActions.COMIC_STATISTICS_LOADING:
      return ComicStatisticsReducerState(
        isLoading: action.isLoading,
        isError: false,
        comicStatisticsModel: null,
      );
    case ComicStatisticsActions.COMIC_STATISTICS_ERROR:
      return ComicStatisticsReducerState(
        isLoading: false,
        isError: action.isError,
        comicStatisticsModel: null,
      );
    case ComicStatisticsActions.COMIC_STATISTICS_LOADED:
      return ComicStatisticsReducerState(
        isLoading: false,
        isError: false,
        comicStatisticsModel: action.comicStatisticsModel,
      );
    default:
      return previousState;
  }
}
