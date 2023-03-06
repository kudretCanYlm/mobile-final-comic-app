import 'dart:async';
import 'dart:io';

import 'package:comic_mobile_app/models/Login/SignUpModel.dart';
import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:comic_mobile_app/pages/LoginPage.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/modals/CircleLoadingModal.dart';
import 'package:comic_mobile_app/widgets/modals/NetworkErrorModal.dart';
import 'package:comic_mobile_app/widgets/popUp/SignErrorPopUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//types
enum AuthActions {
  LOGINING,
  LOGINERROR,
  LOGIN,
  LOGOUT,
}

//objects
//login
class IsLoginingObject {
  AuthActions type;
  bool isLogining;

  IsLoginingObject(this.isLogining, this.type);
}

class IsLoginingErrorObject {
  AuthActions type;
  bool isError;

  IsLoginingErrorObject(this.isError, this.type);
}

class LoginObject {
  AuthActions type;
  bool isLogin;
  String? userId;

  LoginObject(this.userId, this.isLogin, this.type);
}

class LogOutObject {
  AuthActions type;

  LogOutObject(this.type);
}

//types functions
//login
IsLoginingObject IsLogining(bool isLogining) {
  var obj = IsLoginingObject(isLogining, AuthActions.LOGINING);

  return obj;
}

IsLoginingErrorObject IsLoginingError(bool isError) {
  var obj = IsLoginingErrorObject(isError, AuthActions.LOGINERROR);

  return obj;
}

LoginObject Login(String? userId) {
  var obj = LoginObject(userId, true, AuthActions.LOGIN);

  return obj;
}

LogOutObject LogOut() {
  var obj = LogOutObject(AuthActions.LOGOUT);
  return obj;
}

dynamic loginAction(BuildContext context, String username, String password) {
  return (Store<AppReducerState> store) async {
    CircleLoadingModal(context);
    store.dispatch(IsLogining(true));

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      store.dispatch(Login(userCredential.user?.uid));
      store.dispatch(IsLogining(false));

      Navigator.of(context).popUntil((route) => route.settings.name == '/');
      Navigator.of(context).push(mainPageRoute());
    } on FirebaseAuthException catch (e) {
      store.dispatch(IsLogining(false));
      store.dispatch(IsLoginingError(true));

      if (e.code == 'user-not-found') {
        SignErrorPopUp(
            context, 'Incorrect Entry', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        SignErrorPopUp(context, "Incorrect Entry",
            "Wrong password provided for that user.");
      } else {
        NetworkErrorModal(context);
      }
    }
  };
}

dynamic LogOutAction(BuildContext context) {
  return (Store<AppReducerState> store) {
    store.dispatch(LogOut());

    Navigator.pushAndRemoveUntil(
        context, loginPageRoute(), ModalRoute.withName('/'));
  };
}

dynamic LoginWithNotRoute(
    BuildContext context, String username, String password) {
  return (Store<AppReducerState> store) async {
    CircleLoadingModal(context);
    store.dispatch(IsLogining(true));

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      store.dispatch(Login(userCredential.user?.uid));
      store.dispatch(IsLogining(false));

      Navigator.of(context).popUntil((route) => route.settings.name == '/');
    } on FirebaseAuthException catch (e) {
      store.dispatch(IsLogining(false));
      store.dispatch(IsLoginingError(true));

      if (e.code == 'user-not-found') {
        SignErrorPopUp(
            context, 'Incorrect Entry', "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        SignErrorPopUp(context, "Incorrect Entry",
            "Wrong password provided for that user.");
      } else {
        NetworkErrorModal(context);
      }
    }
  };
}
