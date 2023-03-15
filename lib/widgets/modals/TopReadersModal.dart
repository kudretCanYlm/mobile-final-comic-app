import 'package:comic_mobile_app/models/Comic/ComicModelA.dart';
import 'package:comic_mobile_app/models/User/UserModelA.dart';
import 'package:comic_mobile_app/redux/actions/Comic/TopComicsAction.dart';
import 'package:comic_mobile_app/redux/actions/User/TopReadersAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/widgets/card/ComicMicroCard.dart';
import 'package:comic_mobile_app/widgets/card/UserMicroCard.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

Future TopReadersModal(Store<AppReducerState> store, BuildContext context) {
  List<UserModelA> userlist = [];
  bool? isTopReadersLoading = true;
  bool? isTopReadersError = false;

  List<ComicModelA> comicList = [];
  bool? isTopComicsLoading = true;
  bool? isTopComicsError = false;

  store.dispatch(GetTopReaders());
  store.dispatch(GetTopComics());

  return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BORDER_RADIUS_5),
          topRight: Radius.circular(BORDER_RADIUS_5),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          store.onChange.listen((event) {
            setState(() {
              if (event.topReadersReducerState!.topReaderList != null) {
                userlist = event.topReadersReducerState!.topReaderList!;
              }
              if (event.topComicsReducerState!.topComicList != null) {
                comicList = event.topComicsReducerState!.topComicList!;
              }

              isTopComicsLoading = event.topComicsReducerState!.isLoading;
              isTopComicsError = event.topComicsReducerState!.isError;
              isTopReadersLoading = event.topReadersReducerState!.isLoading;
              isTopReadersError = event.topReadersReducerState!.isError;
            });
          });

          return Container(
            height: 330,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [COLOR_A_LIGHT_2, COLOR_A_LIGHT_3, COLOR_C_LIGHT_2],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.linear_scale_outlined,
                    color: COLOR_E_HEAVY_2,
                    size: FONT_SIZE_15,
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: MAR_PAD_4),
                      margin: EdgeInsets.only(
                        top: MAR_PAD_0,
                      ),
                      width: double.infinity,
                      child: TitleTypeA(
                        "Top Readers",
                        textAlign: TextAlign.left,
                        color: COLOR_E_HEAVY_2,
                        fontSize: FONT_SIZE_9,
                      ),
                    )),
                Expanded(
                  flex: 15,
                  child: Container(
                    padding: EdgeInsets.only(left: MAR_PAD_4),
                    margin: EdgeInsets.only(top: MAR_PAD_0),
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: isTopReadersLoading == true ||
                                isTopReadersError == true
                            ? 6
                            : userlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return isTopReadersLoading == true ||
                                  isTopReadersError == true
                              ? UserMicroCardPlaceHolder()
                              : UserMicroCard(userlist[index]);
                        }),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: MAR_PAD_4),
                      margin: EdgeInsets.only(
                        top: MAR_PAD_0,
                      ),
                      width: double.infinity,
                      child: TitleTypeA(
                        "Top Comics",
                        textAlign: TextAlign.left,
                        color: COLOR_E_HEAVY_2,
                        fontSize: FONT_SIZE_9,
                      ),
                    )),
                Expanded(
                  flex: 15,
                  child: Container(
                    padding: EdgeInsets.only(left: MAR_PAD_4),
                    margin: EdgeInsets.only(top: MAR_PAD_0),
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: isTopComicsLoading == true ||
                                isTopComicsError == true
                            ? 6
                            : comicList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return isTopComicsLoading == true ||
                                  isTopComicsError == true
                              ? ComicMicroCardPlaceHolder()
                              : ComicMicroCard(comicList[index]);
                        }),
                  ),
                ),
              ],
            ),
          );
        });
      });
}
