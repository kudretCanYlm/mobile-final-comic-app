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
import 'package:redux/redux.dart';

class ProfileDetailsPage extends StatelessWidget {
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
                  child: ImageUpload(
                    size: 110,
                    iconBackgroundColor: COLOR_D_LIGHT_4,
                  ),
                  margin: EdgeInsets.only(
                    bottom: MAR_PAD_4,
                  ),
                ),
                Column(
                  children: [
                    InputTextBox(
                      "Enter your name",
                      (string) {
                        print(string);
                      },
                      (value) {},
                      hintColor: COLOR_E_HEAVY,
                      inputcolor: COLOR_E_HEAVY,
                      borderColor: COLOR_E_HEAVY,
                      fontSize: FONT_SIZE_6,
                      margin: MAR_PAD_2,
                      obscureText: false,
                      contentPadding: MAR_PAD_1,
                    ),
                    InputTextBox(
                      "Enter your nickname",
                      (string) {
                        print(string);
                      },
                      (value) {},
                      hintColor: COLOR_E_HEAVY,
                      inputcolor: COLOR_E_HEAVY,
                      borderColor: COLOR_E_HEAVY,
                      fontSize: FONT_SIZE_6,
                      margin: MAR_PAD_2,
                      obscureText: false,
                      contentPadding: MAR_PAD_1,
                    ),
                    InputTextBox(
                      "Write your mail",
                      (string) {
                        print(string);
                      },
                      (value) {
                        NotNullValidator(value, "Email");
                      },
                      hintColor: COLOR_E_HEAVY,
                      inputcolor: COLOR_E_HEAVY,
                      borderColor: COLOR_E_HEAVY,
                      fontSize: FONT_SIZE_6,
                      margin: MAR_PAD_2,
                      obscureText: false,
                      contentPadding: MAR_PAD_1,
                    ),
                    InputTextBox(
                      "Write your phone",
                      (string) {
                        print(string);
                      },
                      (value) {
                        NotNullValidator(value, "Password");
                      },
                      hintColor: COLOR_E_HEAVY,
                      inputcolor: COLOR_E_HEAVY,
                      borderColor: COLOR_E_HEAVY,
                      fontSize: FONT_SIZE_6,
                      margin: MAR_PAD_2,
                      obscureText: false,
                      contentPadding: MAR_PAD_1,
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 50,
              child: TextButtonTypeA(
                "Continue",
                () {
                  Navigator.of(context).push(_createRoute());
                },
                borderRadius: BORDER_RADIUS_11,
                backgroundColor: COLOR_E_LIGHT,
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
