import 'dart:convert';
import 'package:comic_mobile_app/models/Search/SearchResultModel.dart';
import 'package:comic_mobile_app/models/Search/common/SearchResultTypes.dart';
import 'package:comic_mobile_app/pages/ComicReviewPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shimmer/shimmer.dart';
import 'package:redux/redux.dart';

class SearchResultCard extends StatelessWidget {
  final double cardWidth;
  final SearchResultModel searchResultModel;

  SearchResultCard(this.searchResultModel, {this.cardWidth = 170});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MAR_PAD_1),
      width: cardWidth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
      ),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(COLOR_G_LIGHT),
        splashColor: COLOR_G_HEAVY,
        borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
        onTap: () {
          switch (searchResultModel.ResultType) {
            case SearchResultTypes.User:
              //Navigator.of(context).push(route)
              break;
            case SearchResultTypes.Comic:
              Navigator.of(context).push(comicReviewPageRoute());
              break;
          }
        },
        child: Container(
          alignment: Alignment.center,
          color: COLOR_G_HEAVY,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(MAR_PAD_1),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: COLOR_G_HEAVY,
                ),
                child: TitleTypeA(
                  searchResultModel.ResultType.name,
                  fontSize: FONT_SIZE_5,
                  color: COLOR_E_HEAVY_2,
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_1)),
                child: Image.memory(
                  base64Decode(searchResultModel.Base64Image),
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
              Container(
                width: double.infinity,
                color: COLOR_E_HEAVY,
                padding: EdgeInsets.symmetric(vertical: MAR_PAD_1),
                child: TitleTypeA(
                  searchResultModel.Name,
                  fontSize: FONT_SIZE_5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultCardPlaceHolder extends StatelessWidget {
  final double cardWidth;

  const SearchResultCardPlaceHolder({this.cardWidth = 170});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(MAR_PAD_1),
        width: cardWidth,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
        ),
        child: Shimmer.fromColors(
          baseColor: COLOR_D_LIGHT_6,
          highlightColor: COLOR_E_HEAVY_2,
          child: Container(
            alignment: Alignment.center,
            color: COLOR_G_HEAVY,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(MAR_PAD_1),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: COLOR_D_LIGHT_6,
                      borderRadius: BorderRadius.circular(BORDER_RADIUS_5)),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(BORDER_RADIUS_1)),
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: COLOR_D_LIGHT_6,
                        borderRadius: BorderRadius.circular(BORDER_RADIUS_5)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: COLOR_D_LIGHT_5,
                  padding: const EdgeInsets.symmetric(vertical: MAR_PAD_1),
                )
              ],
            ),
          ),
        ));
  }
}
