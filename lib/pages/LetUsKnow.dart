import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/redux/actions/Comic/FavoriteAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
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
import 'package:redux/redux.dart';

class LetUsKnow extends StatefulWidget {
  final Store<AppReducerState> store;

  LetUsKnow(this.store);

  @override
  State<StatefulWidget> createState() => _LetUsKnow();
}

List<FavoriteModel> favoriteList = [];
bool? isLoading = true;

class _LetUsKnow extends State<LetUsKnow> {
  @override
  void initState() {
    widget.store.dispatch(GetFavoriteList());

    widget.store.onChange.listen((event) {
      setState(() {
        if (event.favoritesReducerState.favorites != null) {
          favoriteList = event.favoritesReducerState.favorites!;
        }
        isLoading = event.favoritesReducerState.isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: COLOR_E_HEAVY_2,
        elevation: 0,
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
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: MAR_PAD_3, // gap between adjacent chips
                          runSpacing: MAR_PAD_5, // gap between lines
                          children: List.generate(
                              isLoading == true ? 6 : favoriteList.length,
                              (index) {
                            return isLoading == true
                                ? IconButtonTypeAPlaceHolder()
                                : IconButtonTypeA(
                                    favoriteList[index].Name,
                                    favoriteList[index].Id,
                                    favoriteList[index].Icon,
                                    (id) {},
                                    padding: MAR_PAD_4,
                                  );
                          }))
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
                    Navigator.of(context).push(_createRoute(widget.store));
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

Route _createRoute(Store<AppReducerState> state) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProfileDetailsPage(state),
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
