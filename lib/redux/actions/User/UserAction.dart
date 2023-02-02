import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/User/UserModels.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:redux/redux.dart';

enum UserActions {
  USER_STATE_LOADING,
  USER_STATE_ERROR,
  USER_STATE,
}

//objects
class IsUserLoadingObject {
  UserActions type;
  bool isLoading;

  IsUserLoadingObject(this.isLoading, this.type);
}

class UserLoadingErrorObject {
  UserActions type;
  bool isError;

  UserLoadingErrorObject(this.isError, this.type);
}

class UserLoadedObject {
  UserActions type;
  UserModelB user;

  UserLoadedObject(this.user, this.type);
}

//types functions
IsUserLoadingObject IsUserLoading(bool isLoading) {
  var obj = IsUserLoadingObject(isLoading, UserActions.USER_STATE_LOADING);

  return obj;
}

UserLoadingErrorObject UserLoadingError(bool isError) {
  var obj = UserLoadingErrorObject(isError, UserActions.USER_STATE_ERROR);
  return obj;
}

UserLoadedObject UserLoaded(UserModelB user) {
  var obj = UserLoadedObject(user, UserActions.USER_STATE);

  return obj;
}

//actions
dynamic GetCurrentUserAction() {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsUserLoading(true));

    //if (store.state.authReducerState.userId.isEmpty) {
    try {
      var user = await FirebaseFirestore.instance
          .collection("user")
          .doc(store.state.authReducerState.userId)
          .get();

      if (user.exists) {
        var username = user.get("NickName");
        var realname = user.get("RealName");
        var base64Image = user.get("base64Image");

        var model = UserModelB(base64Image, username, realname);

        store.dispatch(UserLoaded(model));
      } else {
        store.dispatch(UserLoadingError(true));
      }
    } on FirebaseException catch (e) {
      store.dispatch(UserLoadingError(true));
    }

    //}
  };
}
