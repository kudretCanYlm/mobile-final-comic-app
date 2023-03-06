import 'package:comic_mobile_app/redux/actions/Page/MainPageIndexAction.dart';
import 'package:comic_mobile_app/redux/reducers/Page/State/MainPageIndexReducerState.dart';

MainPageIndexReducerState MainPageIndexReducer(
    MainPageIndexReducerState previousState, dynamic action) {
  switch (action.type) {
    case MainPageIndexActions.SET_INDEX:
      return MainPageIndexReducerState(index: action.index);
    default:
      return previousState;
  }
}
