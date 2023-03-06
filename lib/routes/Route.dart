import 'package:comic_mobile_app/pages/ComicReviewPage.dart';
import 'package:comic_mobile_app/pages/LetUsKnowPage.dart';
import 'package:comic_mobile_app/pages/LoginPage.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/MyProfilePage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Route _initRoute(Function(Store<AppReducerState> store) route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        StoreBuilder<AppReducerState>(
      builder: (BuildContext context, Store<AppReducerState> store) =>
          route(store),
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

//to login page
Route loginPageRoute() => _initRoute((store) => LoginPage(store));

//to main page
Route mainPageRoute() => _initRoute((store) => MainPage(store));

//to letUsKnow page
Route letUsKnowPageRoute() => _initRoute((store) => LetUsKnowPage(store));

//to profileDetail page
Route profileDetailsPageRoute() =>
    _initRoute((store) => ProfileDetailsPage(store));

//to comicReview page
Route comicReviewPageRoute() => _initRoute((store) => ComicReviewPage(store));

//to myProfile page
Route myProfilePageRoute() => _initRoute((store) => MyProfilePage(store));
