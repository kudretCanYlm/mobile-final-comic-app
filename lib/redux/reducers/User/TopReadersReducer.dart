import 'package:comic_mobile_app/redux/actions/User/TopReadersAction.dart';
import 'package:comic_mobile_app/redux/reducers/User/State/TopReadersReducerState.dart';

TopReadersReducerState TopReadersReducer(
    TopReadersReducerState previousState, dynamic action) {
  switch (action.type) {
    case TopReadersActions.TOP_READERS_LOADING:
      return TopReadersReducerState(
        isLoading: action.isLoading,
        isError: null,
        topReaderList: null,
      );
    case TopReadersActions.TOP_READERS_ERROR:
      return TopReadersReducerState(
        isLoading: null,
        isError: action.isError,
        topReaderList: null,
      );
    case TopReadersActions.TOP_READERS:
      return TopReadersReducerState(
        isLoading: null,
        isError: null,
        topReaderList: action.topReaderList,
      );
    default:
      return previousState;
  }
}
