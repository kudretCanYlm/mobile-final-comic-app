import 'package:comic_mobile_app/redux/actions/Auth/ProfileDetailsAction.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/ProfileDetailsReducerState.dart';

ProfileDetailsReducerState ProfileDetailsReducer(
    ProfileDetailsReducerState previousState, dynamic action) {
  switch (action.type) {
    case ProfileDetailsActions.PROFILE_DETAILS_SENDING:
      return ProfileDetailsReducerState(
        isSending: true,
        isError: false,
        isSended: false,
      );

    case ProfileDetailsActions.PROFILE_DETAILS_SENDING_ERROR:
      return ProfileDetailsReducerState(
        isSending: false,
        isError: true,
        isSended: false,
      );
    case ProfileDetailsActions.PROFILE_DETAILS_SENDED:
      return ProfileDetailsReducerState(
        isSending: false,
        isError: false,
        isSended: true,
      );
    default:
      return previousState;
  }
}
