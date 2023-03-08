import 'package:comic_mobile_app/pages/ComicReviewPage.dart';
import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/LetUsKnowPage.dart';
import 'package:comic_mobile_app/pages/LoginPage.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/MainPage/SubPage/SubMainPage.dart';
import 'package:comic_mobile_app/pages/MainPage/SubPage/SubSearchPage.dart';
import 'package:comic_mobile_app/pages/MyComicsPage.dart';
import 'package:comic_mobile_app/pages/MyProfilePage.dart';
import 'package:comic_mobile_app/pages/PdfReadPage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/pages/SignUpPage.dart';
import 'package:comic_mobile_app/pages/SplashPage.dart';
import 'package:comic_mobile_app/redux/Store.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:home_indicator/home_indicator.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await HomeIndicator.hide();
  await Firebase.initializeApp();
  Store<AppReducerState> store = await createStore();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(store));
  });

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final Store<AppReducerState> store;
  const MyApp(this.store, {super.key});

  //Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: StoreBuilder<AppReducerState>(
            builder: (BuildContext context, Store<AppReducerState> store) =>
                SplashPage(store),
            onInit: (store) {},
          ),
          routes: {
            "/splash": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          SplashPage(store),
                  onInit: (store) {},
                ),
            "/login": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          LoginPage(store),
                  onInit: (store) {},
                ),
            "/signUp": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          SignUpPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/forgotPassword": (context) => ForgotPassword(),
            "/letUsKnow": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          LetUsKnowPage(store),
                  onInit: (store) => {
                    //  store.dispatch(GetFavoriteList()),
                  },
                ),
            "/profileDetails": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          ProfileDetailsPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/main": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          MainPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/SubMainPage": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          SubMainPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/SearchPage": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          SubSearchPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/MyProfilePage": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          MyProfilePage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/MyComicsPage": (context) => MyComicsPage(),
            "/Review": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          ComicReviewPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
                ),
            "/PdfReadPage": (context) => PdfReadPage(),
          },
        ));
  }
}
