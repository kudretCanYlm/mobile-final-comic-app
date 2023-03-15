import 'dart:convert';
import 'dart:io';
import 'package:comic_mobile_app/models/Comic/ComicDataModel.dart';
import 'package:comic_mobile_app/pages/PageStateModels/ComicReviewPageStateModel.dart';
import 'package:comic_mobile_app/pages/PdfReadPage.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicCharacterAction.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicDataAction.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicReviewAction.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicStatisticsAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/card/InfoCard.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/card/CharacterCard.dart';
import 'package:redux/redux.dart';

class ComicReviewPage extends StatefulWidget {
  final Store<AppReducerState> store;
  final String comicId;
  ComicReviewPage(this.store, {Key? key, this.comicId = "Jc6BClaKE8h0kt0ZRTfX"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicReviewPageState();
}

class _ComicReviewPageState extends State<ComicReviewPage> {
  double height = 200.0;

  var comicReviewPageStateModel = ComicReviewPageStateModel();

  bool isDowlanding = true;
  String dowlandPercent = "";

  @override
  void initState() {
    comicReviewPageStateModel.setComicId(widget.comicId);

    super.initState();

    var comicDataList = widget.store.state.comicDataReducerState!.comicData;

    //control comic is there or not
    if (comicDataList.any((element) => element.ComicId == widget.comicId)) {
      var myComic = comicDataList
          .firstWhere((element) => element.ComicId == widget.comicId);

      if (myComic.IsSaved == true) {
        comicReviewPageStateModel.processReadyToRead();
      }

      if (myComic.IsSaving == true) {
        comicReviewPageStateModel.processSaving();
      }

      if (myComic.isComicDowlanded() == false && myComic.getPercent() == "") {
        widget.store.dispatch(DeleteComicById(widget.comicId));
        comicReviewPageStateModel.processReadyToDowland();
      }

      if (myComic.isComicDowlanded() == false && myComic.getPercent() != "") {
        comicReviewPageStateModel.processDowlandingStart();
        listenState();
      }
    } else {
      comicReviewPageStateModel.processReadyToDowland();
    }

    widget.store.dispatch(GetComicReview(comicReviewPageStateModel.ComicId));
    widget.store
        .dispatch(GetComicStatistics(comicReviewPageStateModel.ComicId));

    widget.store.onChange.listen((event) {
      setState(() {
        comicReviewPageStateModel.comicReviewReducerState =
            event.comicReviewReducerState;
        comicReviewPageStateModel.comicStatisticsReducerState =
            event.comicStatisticsReducerState;

        comicReviewPageStateModel.comicCharacterReducerState =
            event.comicCharacterReducerState;
      });
    });
  }

  void downlandData() {
    if (comicReviewPageStateModel.state == ProcessState.Downlandig) return;

    if (comicReviewPageStateModel.state == ProcessState.ReadyToRead) {
      readComicDataPath(widget.comicId).then(
        (value) {
          readComic(value);
        },
      );
    } else {
      //start dowland data
      widget.store.dispatch(SetComicDownland(widget.comicId));
      setState(() {
        comicReviewPageStateModel.processDowlandingStart();
      });
      listenState();
    }
  }

  void listenState() {
    //listen state
    widget.store.onChange.listen((event) {
      if (widget.store.state.comicDataReducerState!.comicData
          .any((element) => element.ComicId == widget.comicId)) {
        setState(() {
          var model = event.comicDataReducerState!.comicData
              .firstWhere((element) => element.ComicId == widget.comicId);
          comicReviewPageStateModel.processDowlanding(model.getPercent());

          if (model.IsSaving == true) {
            comicReviewPageStateModel.processSaving();
          } else if (model.IsSaved == true) {
            comicReviewPageStateModel.processReadyToRead();
          }
        });
      }
    });
  }

  void readComic(String? path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfReadPage(path: path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BORDER_RADIUS_2,
          ),
        ),
        backgroundColor: COLOR_E_HEAVY_2,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(MAR_PAD_3),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu,
                color: COLOR_D_HEAVY,
                size: FONT_SIZE_13,
              ),
            ),
          )
        ],
        leading: Container(
            child: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: COLOR_D_HEAVY,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTypeA(
              "Review",
              fontWeight: FONT_WEIGHT_4,
              fontSize: FONT_SIZE_7,
            )
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
                  ),
                  child: comicReviewPageStateModel
                                  .comicReviewReducerState?.isLoading ==
                              true ||
                          comicReviewPageStateModel.comicReviewReducerState ==
                              null
                      ? SizedBox(
                          height: height,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            baseColor: COLOR_D_LIGHT_6,
                            highlightColor: COLOR_E_HEAVY_2,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: COLOR_D_LIGHT_6,
                                  borderRadius:
                                      BorderRadius.circular(BORDER_RADIUS_5)),
                            ),
                          ))
                      : comicReviewPageStateModel
                                  .comicReviewReducerState!.isError ==
                              true
                          ? Text("error")
                          : Image.memory(
                              base64Decode(comicReviewPageStateModel
                                  .comicReviewReducerState!
                                  .comicReviewModel!
                                  .Base64BackImage),
                              height: height,
                              cacheHeight: height.toInt(),
                              width: MediaQuery.of(context).size.width,
                              cacheWidth:
                                  MediaQuery.of(context).size.width.toInt(),
                              fit: BoxFit.cover,
                              gaplessPlayback: true,
                            ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MAR_PAD_5),
                  padding: EdgeInsets.symmetric(
                    horizontal: MAR_PAD_3,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          comicReviewPageStateModel
                                          .comicReviewReducerState?.isLoading ==
                                      true ||
                                  comicReviewPageStateModel
                                          .comicReviewReducerState ==
                                      null
                              ? Container(
                                  child: Shimmer.fromColors(
                                    baseColor: COLOR_D_LIGHT_6,
                                    highlightColor: COLOR_E_HEAVY_2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: COLOR_D_LIGHT_6,
                                            borderRadius: BorderRadius.circular(
                                                BORDER_RADIUS_1),
                                          ),
                                          height: 25,
                                          width: 100,
                                          margin: EdgeInsets.only(
                                              bottom: MAR_PAD_1),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: COLOR_D_LIGHT_6,
                                            borderRadius: BorderRadius.circular(
                                                BORDER_RADIUS_1),
                                          ),
                                          height: 25,
                                          width: 60,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : comicReviewPageStateModel
                                          .comicReviewReducerState!.isError ==
                                      true
                                  ? Text("hata")
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleTypeA(
                                          comicReviewPageStateModel
                                              .comicReviewReducerState!
                                              .comicReviewModel!
                                              .ComicName,
                                          fontSize: FONT_SIZE_10,
                                        ),
                                        ContentTextA(
                                          comicReviewPageStateModel
                                              .comicReviewReducerState!
                                              .comicReviewModel!
                                              .ComicOwner,
                                          fontSize: FONT_SIZE_6,
                                        ),
                                      ],
                                    ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Icon(
                              Icons.heart_broken_rounded,
                              color: COLOR_E_HEAVY_2,
                              size: FONT_SIZE_13,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              shadowColor: COLOR_D_HEAVY,
                              padding: EdgeInsets.all(MAR_PAD_2),
                              backgroundColor:
                                  COLOR_B_HEAVY, // <-- Button color
                              foregroundColor:
                                  COLOR_E_HEAVY, // <-- Splash color
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.42,
                        margin: EdgeInsets.only(bottom: MAR_PAD_10),
                        child: ContainedTabBarView(
                          tabBarProperties: TabBarProperties(
                            indicatorColor: COLOR_E_HEAVY,
                          ),
                          tabs: [
                            TitleTypeA(
                              "Manga",
                              fontSize: FONT_SIZE_4,
                              fontWeight: FONT_WEIGHT_4,
                            ),
                            TitleTypeA(
                              'Characters',
                              fontSize: FONT_SIZE_4,
                              fontWeight: FONT_WEIGHT_4,
                            ),
                            TitleTypeA(
                              'Chapters',
                              fontSize: FONT_SIZE_4,
                              fontWeight: FONT_WEIGHT_4,
                            ),
                          ],
                          views: [
                            ListView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                comicReviewPageStateModel
                                                .comicStatisticsReducerState
                                                ?.isLoading ==
                                            true ||
                                        comicReviewPageStateModel
                                                .comicStatisticsReducerState ==
                                            null
                                    ? InfoCardPlaceHolder()
                                    : comicReviewPageStateModel
                                                .comicStatisticsReducerState
                                                ?.isError ==
                                            true
                                        ? Text("Error")
                                        : InfoCard(comicReviewPageStateModel
                                            .comicStatisticsReducerState!
                                            .comicStatisticsModel!),
                                comicReviewPageStateModel
                                                .comicReviewReducerState
                                                ?.isLoading ==
                                            true ||
                                        comicReviewPageStateModel
                                                .comicReviewReducerState ==
                                            null
                                    ? Container(
                                        child: Shimmer.fromColors(
                                            baseColor: COLOR_D_LIGHT_6,
                                            highlightColor: COLOR_E_HEAVY_2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: MAR_PAD_2),
                                                  decoration: BoxDecoration(
                                                    color: COLOR_D_LIGHT_6,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            BORDER_RADIUS_3),
                                                  ),
                                                  height: 250,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                ),
                                              ],
                                            )),
                                      )
                                    : comicReviewPageStateModel
                                                .comicReviewReducerState!
                                                .isError ==
                                            true
                                        ? Text("hata")
                                        : ContentTextA(comicReviewPageStateModel
                                            .comicReviewReducerState!
                                            .comicReviewModel!
                                            .ComicResume),
                              ],
                            ),
                            ListView(
                              physics: BouncingScrollPhysics(),
                              children: List.generate(
                                comicReviewPageStateModel
                                                .comicCharacterReducerState
                                                ?.comicCharacterList ==
                                            null ||
                                        comicReviewPageStateModel
                                                .comicCharacterReducerState
                                                ?.isLoading ==
                                            true
                                    ? 3
                                    : comicReviewPageStateModel
                                                .comicCharacterReducerState
                                                ?.isError ==
                                            true
                                        ? 1
                                        : comicReviewPageStateModel
                                            .comicCharacterReducerState!
                                            .comicCharacterList!
                                            .length,
                                (index) {
                                  return comicReviewPageStateModel
                                                  .comicCharacterReducerState
                                                  ?.comicCharacterList ==
                                              null ||
                                          comicReviewPageStateModel
                                                  .comicCharacterReducerState
                                                  ?.isLoading ==
                                              true
                                      ? CharacterCardPlaceHolder()
                                      : comicReviewPageStateModel
                                                  .comicCharacterReducerState
                                                  ?.isError ==
                                              true
                                          ? Text("Error")
                                          : CharacterCard(
                                              comicReviewPageStateModel
                                                  .comicCharacterReducerState!
                                                  .comicCharacterList![index]);
                                },
                              ),
                            ),
                            ListView(
                              children: [Text("will add")],
                            )
                          ],
                          onChange: (index) {
                            if (index == 1 &&
                                comicReviewPageStateModel
                                        .comicCharacterReducerState!
                                        .comicCharacterList ==
                                    null) {
                              widget.store.dispatch(GetComicCharacters(
                                  comicReviewPageStateModel.ComicId));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 60,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                padding: Platform.isIOS
                    ? EdgeInsets.symmetric(
                        vertical: MAR_PAD_0, horizontal: MAR_PAD_4)
                    : EdgeInsets.all(MAR_PAD_1),
                child: TextButtonTypeA(comicReviewPageStateModel.buttonText,
                    margin: MAR_PAD_0,
                    backgroundColor:
                        comicReviewPageStateModel.buttonbackgroundColor,
                    borderRadius: BORDER_RADIUS_8, () {
                  //dowlandAndReadComic();
                  downlandData();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
