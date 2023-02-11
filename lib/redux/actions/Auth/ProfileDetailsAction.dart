//typs
import 'package:comic_mobile_app/models/Login/ProfileDetailsModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

enum ProfileDetailsActions {
  PROFILE_DETAILS_SENDING,
  PROFILE_DETAILS_SENDING_ERROR,
  PROFILE_DETAILS_SENDED
}

//objects
class ProfileDetailsSendingObject {
  ProfileDetailsActions type;
  bool isSending;

  ProfileDetailsSendingObject(this.isSending, this.type);
}

class ProfileDetailsSendingErrorObject {
  ProfileDetailsActions type;
  bool isError;

  ProfileDetailsSendingErrorObject(this.isError, this.type);
}

class ProfileDetailsSendedObject {
  ProfileDetailsActions type;
  bool isSended;

  ProfileDetailsSendedObject(this.isSended, this.type);
}

//types functions
ProfileDetailsSendingObject ProfileDetailsSending(bool isSending) {
  var obj = ProfileDetailsSendingObject(
      isSending, ProfileDetailsActions.PROFILE_DETAILS_SENDING);

  return obj;
}

ProfileDetailsSendingErrorObject ProfileDetailsSendingError(bool isError) {
  var obj = ProfileDetailsSendingErrorObject(
      isError, ProfileDetailsActions.PROFILE_DETAILS_SENDING_ERROR);
  return obj;
}

ProfileDetailsSendedObject ProfileDetailsSended(bool isSended) {
  var obj = ProfileDetailsSendedObject(
      isSended, ProfileDetailsActions.PROFILE_DETAILS_SENDED);
  return obj;
}

dynamic PushProfileDetails(
    BuildContext context, ProfileDetailsModel profileDetailsModel) {
  return (Store<AppReducerState> store) async {};
}
