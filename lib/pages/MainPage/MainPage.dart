import 'package:comic_mobile_app/pages/MainPage/SubPage/SubMainPage.dart';
import 'package:comic_mobile_app/pages/MainPage/SubPage/SubSearchPage.dart';
import 'package:comic_mobile_app/pages/MyProfilePage.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicAction.dart';
import 'package:comic_mobile_app/redux/actions/Comic/LikedComicAction.dart';
import 'package:comic_mobile_app/redux/actions/User/UserAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';

class MainPage extends StatefulWidget {
  final Store<AppReducerState> store;

  const MainPage(this.store, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int bar_index = 1;

  late Animation<Color?> colorAnimationIcon;
  late Animation<Color?> colorAnimationBg;
  late AnimationController animationController;

  final Color tabBarColorA = COLOR_G_LIGHT;
  final Color tabBarColorB = COLOR_E_HEAVY_2;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // color tween
    colorAnimationIcon = ColorTween(begin: tabBarColorA, end: tabBarColorB)
        .animate(animationController);

    colorAnimationBg = ColorTween(begin: tabBarColorB, end: tabBarColorA)
        .animate(animationController);

    animationController.forward();
    widget.store.dispatch(GetCurrentUserAction());
    widget.store.dispatch(GetComicList());
    widget.store.dispatch(GetLikedComicList());

    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {
        bar_index = _tabController.index;
        if (bar_index == 1) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
      });
    });
    super.initState();
  }

  void animateColor() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: MAR_PAD_3),
        clipBehavior: Clip.none,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
        ),
        child: TabBar(
          controller: _tabController,
          dragStartBehavior: DragStartBehavior.down,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorColor: Colors.transparent,
          unselectedLabelColor: COLOR_G_LIGHT,
          labelColor: COLOR_G_HEAVY,
          tabs: [
            Tab(
              icon: FaIcon(
                FontAwesomeIcons.search,
              ),
            ),
            Tab(
              child: InkWell(
                child: AnimatedBuilder(
                    animation: colorAnimationBg,
                    builder: (BuildContext _, Widget? __) {
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.all(MAR_PAD_2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: colorAnimationBg.value,
                          ),
                          child: AnimatedBuilder(
                              animation: colorAnimationIcon,
                              builder: (BuildContext _, Widget? __) {
                                return FaIcon(
                                  FontAwesomeIcons.home,
                                  size: FONT_SIZE_10,
                                  color: colorAnimationIcon.value,
                                );
                              }));
                    }),
              ),
            ),
            Tab(
              icon: FaIcon(
                FontAwesome5.user,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        SubSearchPage(),
        SubMainPage(widget.store),
        MyProfilePage()
      ]),
    );
  }
}
