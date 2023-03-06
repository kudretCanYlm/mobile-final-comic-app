import 'package:comic_mobile_app/redux/actions/Comic/ComicDataAction.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicDataReducerState.dart';

ComicDataReducerState ComicDataReducer(
    ComicDataReducerState previousState, dynamic action) {
  switch (action.type) {
    case ComicDataActions.SET_COMIC_DATA_LIST:
      return ComicDataReducerState(action.models);
    default:
      return previousState;
  }
}
