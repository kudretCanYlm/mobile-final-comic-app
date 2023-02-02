import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/widgets/buttons/IconButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeb.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class LetUsKnow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: COLOR_E_HEAVY_2,
      ),
      body: Container(
        padding: EdgeInsets.all(MAR_PAD_4),
        decoration: BoxDecoration(
          color: COLOR_E_HEAVY_2,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //texts
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TitleTypeA(
                      "Let Us Know",
                      fontSize: FONT_SIZE_17,
                      color: COLOR_D_LIGHT_1,
                      fontWeight: FONT_WEIGHT_5,
                      letterSpacing: LETTER_SPACING_9,
                      margin: MAR_PAD_0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 180,
                      child: ContentTextA(
                        "Choose your genre to find favorite titles here",
                        fontSize: FONT_SIZE_5,
                        color: COLOR_D_LIGHT_3,
                        textAlign: TextAlign.center,
                        letterSpacing: LETTER_SPACING_4,
                      ),
                    ),
                  ],
                ),

                //icons
                Container(
                  margin: EdgeInsets.only(top: MAR_PAD_6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: MAR_PAD_3, // gap between adjacent chips
                        runSpacing: MAR_PAD_5, // gap between lines
                        children: <Widget>[
                          IconButtonTypeA(
                            "Action",
                            "45",
                            Icons.attractions,
                            (id) {},
                            padding: MAR_PAD_4,
                          ),
                          IconButtonTypeA("Romance", "45",
                              Icons.heart_broken_outlined, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA(
                              "Apple", "45", Icons.apple_sharp, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA("Smile", "45",
                              Icons.sentiment_satisfied_alt_outlined, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA("Sports", "45",
                              Icons.sports_martial_arts_rounded, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA(
                              "Anchor", "45", Icons.anchor_sharp, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA(
                              "Dark", "45", Icons.dark_mode_rounded, (id) {},
                              padding: MAR_PAD_4),
                          IconButtonTypeA(
                              "Sunny", "45", Icons.wb_sunny_outlined, (id) {},
                              padding: MAR_PAD_4),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            //buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtonTypeA(
                  "Continue",
                  () {
                    Navigator.of(context).push(_createRoute());
                  },
                  borderRadius: BORDER_RADIUS_11,
                  backgroundColor: COLOR_D_LIGHT_3,
                ),
                TextButtonTypeB(
                  "Skip for now",
                  () {},
                  fontSize: FONT_SIZE_4,
                  textColor: COLOR_D_LIGHT_2,
                  margin: MAR_PAD_0,
                  width: 95,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProfileDetailsPage(),
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
