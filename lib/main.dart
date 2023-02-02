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
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
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
            "/singIn": (context) => SignUpPage(),
            "/forgotPassword": (context) => ForgotPassword(),
            "/letUsKnow": (context) => LetUsKnow(),
            "/profileDetails": (context) => ProfileDetailsPage(),
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
            "/SearchPage": (context) => SubSearchPage(),
            "/MyProfilePage": (context) => MyProfilePage(),
            "/MyComicsPage": (context) => MyComicsPage(),
            "/Review": (context) => ComicReview(),
            "/PdfReadPage": (context) => PdfReadPage(),
          },
        ));
  }
}
