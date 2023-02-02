import 'package:comic_mobile_app/pages/LetUsKnow.dart';
import 'package:comic_mobile_app/widgets/buttons/IconButtonTypeB.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeB.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons/TextButtonTypeA.dart';
import 'ProfileDetailsPage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        "Sign up to start",
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            InputTextBox(
                              "Login",
                              (string) {
                                print(string);
                              },
                              (value) {},
                              hintColor: COLOR_E_HEAVY_2,
                              inputcolor: COLOR_E_HEAVY_2,
                              fontSize: FONT_SIZE_6,
                              margin: MAR_PAD_1,
                            ),
                            InputTextBox("Password", (string) {
                              print(string);
                            }, (value) {},
                                hintColor: COLOR_E_HEAVY_2,
                                inputcolor: COLOR_E_HEAVY_2,
                                fontSize: FONT_SIZE_6,
                                margin: MAR_PAD_1,
                                obscureText: true),
                            InputTextBox("Complete Password", (string) {
                              print(string);
                            }, (value) {},
                                hintColor: COLOR_E_HEAVY_2,
                                inputcolor: COLOR_E_HEAVY_2,
                                fontSize: FONT_SIZE_6,
                                margin: MAR_PAD_1,
                                obscureText: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextButtonTypeA(
                    "Continue",
                    () {
                      Navigator.of(context).push(_createRoute());
                    },
                    borderRadius: BORDER_RADIUS_11,
                    backgroundColor: COLOR_D_LIGHT_3,
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LetUsKnow(),
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
