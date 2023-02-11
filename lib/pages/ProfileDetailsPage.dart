import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/SignUpPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
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
import 'package:comic_mobile_app/widgets/inputs/upload/ImageUpload.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redux/redux.dart';

class ProfileDetailsPage extends StatefulWidget {
  final Store<AppReducerState> store;

  ProfileDetailsPage(this.store);

  @override
  State<StatefulWidget> createState() => _ProfileDetailsPage();
}

class _ProfileDetailsPage extends State<ProfileDetailsPage> {
  final formKey = GlobalKey<FormState>();

  bool allowNatifications = false;
  bool agreeTerms = false;
  bool sendEmail = false;
  bool iscontinueButtonActive = false;
  Color buttonBackgroundColor = COLOR_D_LIGHT_3;

  void continueButtonControl() {
    setState(() {
      if (allowNatifications && agreeTerms && sendEmail) {
        iscontinueButtonActive = true;
        buttonBackgroundColor = COLOR_E_HEAVY;
      } else {
        iscontinueButtonActive = false;
        buttonBackgroundColor = COLOR_D_LIGHT_3;
      }
    });
  }

  void readImage(String base64) {
    print("uzunluk");
    print(base64.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
            left: MAR_PAD_5,
            right: MAR_PAD_5,
            top: MediaQuery.of(context).viewPadding.top + MAR_PAD_1,
            bottom: MAR_PAD_5),
        decoration: BoxDecoration(
          color: COLOR_E_HEAVY_2,
          image: DecorationImage(
            image: AssetImage(
                "lib/assets/bg-images/Mountain_Range_Background.jpg"),
            fit: BoxFit.none,
            scale: 1,
            colorFilter: ColorFilter.mode(COLOR_D_HEAVY, BlendMode.color),
            opacity: 0.35,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: MAR_PAD_4,
                  ),
                  child: ImageUpload(
                    readImage,
                    size: 110,
                    iconBackgroundColor: COLOR_D_LIGHT_4,
                  ),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputTextBox(
                          "Enter your name",
                          (string) {
                            print(string);
                          },
                          (value) => LengthValidator(value, 2, 50),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        InputTextBox(
                          "Enter your nickname",
                          (string) {
                            print(string);
                          },
                          (value) => LengthValidator(value, 5, 50),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        InputTextBox(
                          "Write your phone",
                          (string) {
                            print(string);
                          },
                          (value) => PhoneValidador(value),
                          hintColor: COLOR_E_HEAVY,
                          inputcolor: COLOR_E_HEAVY,
                          borderColor: COLOR_E_HEAVY,
                          fontSize: FONT_SIZE_6,
                          marginVertical: MAR_PAD_0,
                          obscureText: false,
                          contentPadding: MAR_PAD_1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: COLOR_D_HEAVY_V50,
                              borderRadius: BorderRadius.circular(MAR_PAD_3)),
                          padding: EdgeInsets.all(MAR_PAD_1),
                          margin: EdgeInsets.only(top: MAR_PAD_4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Allow Notifications",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: allowNatifications,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        allowNatifications = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Agree Terms",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: agreeTerms,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        agreeTerms = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTypeA(
                                    "Send Email",
                                    color: COLOR_E_HEAVY_2,
                                    fontWeight: FONT_WEIGHT_4,
                                    fontSize: FONT_SIZE_6,
                                  ),
                                  Switch(
                                    value: sendEmail,
                                    activeTrackColor: COLOR_F_HEAVY,
                                    activeColor: COLOR_E_HEAVY_2,
                                    inactiveThumbColor: COLOR_D_LIGHT_3,
                                    inactiveTrackColor: COLOR_D_LIGHT_2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        sendEmail = value;
                                      });
                                      continueButtonControl();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              height: 50,
              child: TextButtonTypeA(
                "Continue",
                () {
                  if (formKey.currentState!.validate() &&
                      iscontinueButtonActive) {
                    print("valid");
                  }
                  //Navigator.of(context).push(_createRoute());
                },
                borderRadius: BORDER_RADIUS_11,
                backgroundColor: buttonBackgroundColor,
                textColor: COLOR_D_HEAVY,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        StoreBuilder<AppReducerState>(
      builder: (BuildContext context, Store<AppReducerState> store) =>
          MainPage(store),
      onInit: (store) => {
        //store.dispatch();
      },
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
