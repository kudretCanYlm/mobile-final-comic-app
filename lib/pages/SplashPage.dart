import 'package:comic_mobile_app/pages/LoginPage.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SplashPage extends StatefulWidget {
  final Store<AppReducerState> store;

  SplashPage(this.store);

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.store.state.authReducerState!.userId != null) {
        Navigator.of(context).pushAndRemoveUntil(
            mainPageRoute(), ModalRoute.withName('/splash'));
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            loginPageRoute(), ModalRoute.withName('/sğlash'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: COLOR_E_HEAVY_2,
        elevation: 0,
      ),
      backgroundColor: COLOR_E_HEAVY_2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image
            Expanded(
              flex: 5,
              child: Image.asset(
                "lib/assets/tjz62Wka.png",
                width: 250,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(MAR_PAD_5),
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: COLOR_B_LIGHT,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
