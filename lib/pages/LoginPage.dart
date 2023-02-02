import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/SignUpPage.dart';
import 'package:comic_mobile_app/redux/actions/Auth/AuthAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/utils/validators/InputValidator.dart';
import 'package:comic_mobile_app/widgets/buttons/IconButtonTypeB.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeB.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:comic_mobile_app/widgets/modals/NetworkErrorModal.dart';
import 'package:comic_mobile_app/widgets/popUp/LoginPopUp.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  final Store<AppReducerState> store;

  LoginPage(this.store);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String userName = "";
  String password = "";

  Future<void> login(BuildContext context) async {
    //Registration
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(
    //           email: "barry.allen@example.com",
    //          password: "SuperSecretPassword!");
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }

    //Sign-in

    widget.store.dispatch(loginAction(context, userName, password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: COLOR_E_HEAVY_2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(MAR_PAD_5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: COLOR_E_HEAVY_2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TitleTypeA(
                        "Welcome",
                        fontSize: FONT_SIZE_17,
                        color: COLOR_D_LIGHT_1,
                        fontWeight: FONT_WEIGHT_5,
                        letterSpacing: LETTER_SPACING_9,
                        margin: MAR_PAD_0,
                      ),
                      ContentTextA(
                        "Sign in to start",
                        fontSize: FONT_SIZE_5,
                        color: COLOR_D_LIGHT_3,
                      )
                    ],
                  ),
                  IconButtonTypeB(
                    "Continue with Google",
                    () {},
                    Icons.heart_broken_rounded,
                    iconColor: COLOR_B_HEAVY,
                    margin: MAR_PAD_1,
                    textColor: COLOR_D_HEAVY,
                  ),
                  Container(
                    child: Column(
                      children: [
                        IconButtonTypeB(
                          "Continue with Meta",
                          () {},
                          Icons.face,
                          iconColor: COLOR_E_HEAVY,
                          margin: MAR_PAD_1,
                          textColor: COLOR_E_HEAVY,
                          backColor: COLOR_A_HEAVY,
                          padding: MAR_PAD_2,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContentTextA(
                                "Haven't account ?",
                                fontSize: FONT_SIZE_7,
                                margin: MAR_PAD_0,
                              ),
                              TextButtonTypeB(
                                "Sign Up",
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(),
                                      //settings: RouteSettings()
                                    ),
                                  );
                                },
                                textColor: COLOR_A_HEAVY,
                                width: 85,
                                fontSize: FONT_SIZE_7,
                                margin: MAR_PAD_0,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(MAR_PAD_4),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [COLOR_A_LIGHT_2, COLOR_A_LIGHT_3, COLOR_C_LIGHT_2],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(BORDER_RADIUS_5),
                    topRight: Radius.circular(BORDER_RADIUS_5),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              InputTextBox(
                                "Email",
                                (string) {
                                  setState(() {
                                    userName = string;
                                  });
                                },
                                (value) => EmailValitador(value),
                                hintColor: COLOR_E_HEAVY_2,
                                inputcolor: COLOR_E_HEAVY_2,
                                fontSize: FONT_SIZE_6,
                                margin: MAR_PAD_1,
                                textInputAction: TextInputAction.next,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InputTextBox(
                                    "Password",
                                    (string) {
                                      password = string;
                                    },
                                    (value) => PasswordValitador(value),
                                    hintColor: COLOR_E_HEAVY_2,
                                    inputcolor: COLOR_E_HEAVY_2,
                                    fontSize: FONT_SIZE_6,
                                    margin: MAR_PAD_1,
                                    obscureText: true,
                                    textInputAction: TextInputAction.go,
                                  ),
                                  TextButtonTypeB(
                                    "forgot password",
                                    () {
                                      // Navigator.of(context).push(_createRoute());
                                    },
                                    fontSize: FONT_SIZE_4,
                                    textColor: COLOR_E_HEAVY_2,
                                    margin: MAR_PAD_0,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextButtonTypeA(
                          "Continue",
                          () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (formKey.currentState!.validate()) {
                              login(context);
                            }
                          },
                          borderRadius: BORDER_RADIUS_11,
                          backgroundColor: COLOR_D_LIGHT_3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
