import 'package:comic_mobile_app/models/Search/SearchResultModel.dart';
import 'package:comic_mobile_app/redux/actions/Page/MainPageIndexAction.dart';
import 'package:comic_mobile_app/redux/actions/Search/SearchAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/widgets/card/search/SearchResultCard.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/NormalTextBox.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:comic_mobile_app/models/Search/common/SearchResultTypes.dart';

class SubSearchPage extends StatefulWidget {
  final Store<AppReducerState> store;
  SubSearchPage(this.store, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubSearchPageState();
}

class _SubSearchPageState extends State<SubSearchPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var controller = ScrollController();

  List<SearchResultModel> searchResultList = [];
  bool? isSearching;
  bool? notFound;
  bool? isError;

  @override
  void initState() {
    widget.store.dispatch(InitSearch());
    widget.store.onChange.listen((event) {
      setState(() {
        if (event.searchReducerState.searced == true) {
          searchResultList = event.searchReducerState.searches!;
        } else {
          searchResultList = [];
        }

        isSearching = event.searchReducerState.isSearcing;
        notFound = event.searchReducerState.notfound;
        isError = event.searchReducerState.isError;
        print(isSearching);
      });
    });

    super.initState();
    controller.addListener(onScroll);
  }

  void onSearch(String text) {
    if (text == "") {
      widget.store.dispatch(InitSearch());
      setState(() {
        searchResultList = [];
      });
    } else {
      widget.store.dispatch(Search(text));
    }
  }

  //scroll animation
  double height = 0.0;
  double oldHeight = 0.0;
  double itemHeight = 28.0;
  double itemsCount = 20;
  double screenWidth = 0;
  double imageSize = 100;
  Color appBarColor = COLOR_E_HEAVY_2;
  int colorSize = 250;
  Color barColor = Color.fromRGBO(98, 0, 238, 1);
  double scale = 2;

  onScroll() {
    setState(() {
      height = controller.offset;

      if (height < 30) {
        barColor = Color.fromRGBO(98, 0 + (height * scale).toInt(),
            238 - (height * scale).toInt(), 1);
      }
    });

    oldHeight = height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: barColor,
        elevation: 0,
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(BORDER_RADIUS_2),
                  bottomRight: Radius.circular(BORDER_RADIUS_2),
                ),
              ),
              pinned: true,
              expandedHeight: 80,
              toolbarHeight: 60,
              floating: true,
              automaticallyImplyLeading: false,
              backgroundColor: barColor,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(horizontal: MAR_PAD_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: CircleBorder(),
                          shadowColor: COLOR_D_HEAVY,
                          padding: EdgeInsets.all(MAR_PAD_2),
                          backgroundColor: barColor, // <-- Button color
                        ),
                        onPressed: () {
                          widget.store.dispatch(SetIndex(1));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: COLOR_E_HEAVY_2,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: MAR_PAD_1),
                      child: NormalTextBox(
                        "Search",
                        (text) => onSearch(text),
                        borderColor: barColor,
                        hintColor: COLOR_E_HEAVY_2,
                        inputcolor: COLOR_E_HEAVY_2,
                        margin: MAR_PAD_0,
                      ),
                    )),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: CircleBorder(),
                          shadowColor: COLOR_D_HEAVY,
                          padding: EdgeInsets.all(MAR_PAD_2),
                          backgroundColor: barColor, // <-- Button color
                        ),
                        onPressed: () {
                          print("filter modal");
                        },
                        child: const Icon(
                          Icons.menu,
                          color: COLOR_E_HEAVY_2,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  child: searchResultList.length == 0 &&
                          notFound == false &&
                          isSearching == false
                      ? Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.select_all_outlined,
                                size: FONT_SIZE_BIG_10,
                                color: barColor,
                              ),
                              TitleTypeA(
                                "Search Any",
                                color: barColor,
                                fontSize: FONT_SIZE_14,
                                fontFamily: FONT_FAMILY_C ?? FONT_FAMILY_A,
                              )
                            ],
                          ),
                        )
                      : notFound == true
                          ? Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.no_cell_outlined,
                                    size: FONT_SIZE_BIG_10,
                                    color: barColor,
                                  ),
                                  TitleTypeA(
                                    "Not Found",
                                    color: barColor,
                                    fontSize: FONT_SIZE_14,
                                    fontFamily: FONT_FAMILY_C ?? FONT_FAMILY_A,
                                  )
                                ],
                              ),
                            )
                          : Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: List.generate(
                                isSearching == true
                                    ? 6
                                    : searchResultList.length,
                                (index) {
                                  return isSearching == true
                                      ? SearchResultCardPlaceHolder(
                                          cardWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                        )
                                      : SearchResultCard(
                                          searchResultList[index],
                                          cardWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                        );
                                },
                              ),
                            ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
