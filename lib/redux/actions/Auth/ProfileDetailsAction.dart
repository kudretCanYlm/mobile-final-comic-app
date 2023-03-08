//typs
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/Helper/string/ImageHelper.dart';
import 'package:comic_mobile_app/models/Login/ProfileDetailsModel.dart';
import 'package:comic_mobile_app/pages/LetUsKnowPage.dart';
import 'package:comic_mobile_app/redux/actions/Auth/AuthAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/modals/CircleLoadingModal.dart';
import 'package:comic_mobile_app/widgets/popUp/SignErrorPopUp.dart';
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

dynamic PostProfileDetails(
    BuildContext context, ProfileDetailsModel profileDetailsModel) {
  return (Store<AppReducerState> store) async {
    CircleLoadingModal(context);
    store.dispatch(ProfileDetailsSending(true));
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users.doc(store.state.registerReducerState!.userId).set({
        'NickName': profileDetailsModel.NickName, // John Doe
        'Phone': profileDetailsModel.Phone, // Stokes and Sons
        'RealName': profileDetailsModel.RealName, // 42
        'base64Image':
            ResizeImageFromBase64(profileDetailsModel.base64Image, 650,650)
      }).then((value) {
        store.dispatch(ProfileDetailsSended(true));
        store.dispatch(Login(store.state.registerReducerState!.userId));
        Navigator.of(context).popUntil((route) => route.settings.name == '/');
        Navigator.of(context).push(letUsKnowPageRoute());
      }).catchError((error) {
        store.dispatch(ProfileDetailsSendingError(true));
        SignErrorPopUp(context, 'Error', error.toString());
      });
    }

    addUser();
  };
}
