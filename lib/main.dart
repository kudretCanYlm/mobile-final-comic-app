import 'package:comic_mobile_app/pages/ComicReview.dart';
import 'package:comic_mobile_app/pages/ForgotPassword.dart';
import 'package:comic_mobile_app/pages/LetUsKnow.dart';
import 'package:comic_mobile_app/pages/LoginPage.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/pages/MainPage/SubPage/SubMainPage.dart';
import 'package:comic_mobile_app/pages/MainPage/SubPage/SubSearchPage.dart';
import 'package:comic_mobile_app/pages/MyComicsPage.dart';
import 'package:comic_mobile_app/pages/MyProfilePage.dart';
import 'package:comic_mobile_app/pages/PdfReadPage.dart';
import 'package:comic_mobile_app/pages/ProfileDetailsPage.dart';
import 'package:comic_mobile_app/pages/SignUpPage.dart';
import 'package:comic_mobile_app/redux/Store.dart';
import 'package:comic_mobile_app/redux/actions/Comic/FavoriteAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: createStore(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: StoreBuilder(
            builder: (BuildContext context, Store<AppReducerState> store) =>
                LoginPage(store),
            onInit: (store) => {
              //store.dispatch();
            },
          ),
          routes: {
            "/login": (context) => StoreBuilder<AppReducerState>(
                  builder:
                      (BuildContext context, Store<AppReducerState> store) =>
                          LoginPage(store),
                  onInit: (store) => {
                    //store.dispatch();
                  },
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
                          LetUsKnow(store),
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
            "/MyProfilePage": (context) => MyProfilePage(),
            "/MyComicsPage": (context) => MyComicsPage(),
            "/Review": (context) => ComicReview(),
            "/PdfReadPage": (context) => PdfReadPage(),
          },
        ));
  }
}
