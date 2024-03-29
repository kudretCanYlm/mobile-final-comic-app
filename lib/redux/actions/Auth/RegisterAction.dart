import 'package:comic_mobile_app/models/Login/SignUpModel.dart';
import 'package:comic_mobile_app/pages/LetUsKnowPage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/redux/actions/Auth/AuthAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/modals/CircleLoadingModal.dart';
import 'package:comic_mobile_app/widgets/modals/NetworkErrorModal.dart';
import 'package:comic_mobile_app/widgets/popUp/SignErrorPopUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//types
enum RegisterActions {
  REGISTERING,
  REGISTER_ERROR,
  REGISTER,
}

//objects
class IsRegisteringObject {
  RegisterActions type;
  bool isRegistering;

  IsRegisteringObject(this.isRegistering, this.type);
}

class IsRegisteringErrorObject {
  RegisterActions type;
  bool isError;

  IsRegisteringErrorObject(this.isError, this.type);
}

class RegisterObject {
  RegisterActions type;
  bool isRegister;
  String? userId;

  RegisterObject(this.isRegister, this.userId, this.type);
}

//types functions
IsRegisteringObject IsRegistering(bool isRegistering) {
  var obj = IsRegisteringObject(isRegistering, RegisterActions.REGISTERING);

  return obj;
}

IsRegisteringErrorObject IsRegisteringError(bool isError) {
  var obj = IsRegisteringErrorObject(isError, RegisterActions.REGISTER_ERROR);

  return obj;
}

RegisterObject Register(String? userId) {
  var obj = RegisterObject(true, userId, RegisterActions.REGISTER);

  return obj;
}

//actions
dynamic RegisterAction(BuildContext context, SignUpModel signUpModel) {
  return (Store<AppReducerState> store) async {
    CircleLoadingModal(context);
    store.dispatch(IsRegistering(true));

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUpModel.Email, password: signUpModel.Password);

      store.dispatch(Register(userCredential.user?.uid));
      store.dispatch(
          LoginWithNotRoute(context, signUpModel.Email, signUpModel.Password));

      Navigator.of(context).popUntil((route) => route.settings.name == '/');
      Navigator.of(context).push(profileDetailsPageRoute());
    } on FirebaseAuthException catch (e) {
      store.dispatch(IsRegisteringError(true));

      if (e.code == 'weak-password') {
        SignErrorPopUp(context, 'Incorrect Register',
            "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        SignErrorPopUp(context, 'Incorrect Register',
            "The account already exists for that email.");
      }
    } catch (e) {
      NetworkErrorModal(context);
    }
  };
}
