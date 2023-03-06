import 'dart:convert';
import 'package:comic_mobile_app/models/Comic/ComicCardModelA.dart';
import 'package:comic_mobile_app/pages/ComicReviewPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shimmer/shimmer.dart';
import 'package:redux/redux.dart';

class ComicMiniCard extends StatelessWidget {
  final double marginHorizantal;
  final double marginVertical;
  final double cardwidth;
  final double cardHeight;
  final double imageHeight;
  final double imageBorderRadius;
  final bool isWithDescr;
  final ComicCardModelA comic;
  final void Function(String) callback;

  const ComicMiniCard(this.comic, this.callback,
      {super.key,
      this.marginHorizantal = MAR_PAD_1,
      this.marginVertical = MAR_PAD_2,
      this.cardwidth = 180,
      this.cardHeight = 330,
      this.imageHeight = 230,
      this.imageBorderRadius = BORDER_RADIUS_3,
      this.isWithDescr = true});

  @override
  Widget build(BuildContext context) {
    return (Container(
      //decoration: BoxDecoration(border: Border.all()),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).push(comicReviewPageRoute()),
        },
        child: Container(
          padding: EdgeInsets.all(MAR_PAD_1),
          width: cardwidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: COLOR_E_HEAVY_2,
            borderRadius: BorderRadius.circular(BORDER_RADIUS_4),
            boxShadow: [
              BoxShadow(
                color: COLOR_D_LIGHT_5,
                blurRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(MAR_PAD_1),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: COLOR_E_LIGHT,
                      blurRadius: 15,
                      offset: Offset(3, -3))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imageBorderRadius),
                  child: Image.memory(
                    base64Decode(comic.ImageBase64),
                    fit: BoxFit.cover,
                    height: imageHeight,
                    width: double.infinity,
                    gaplessPlayback: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(MAR_PAD_1),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTypeA(
                      comic.ComicName,
                      fontWeight: FONT_WEIGHT_4,
                      margin: MAR_PAD_0,
                      color: COLOR_D_LIGHT_1,
                    ),
                    isWithDescr
                        ? ContentTextA(
                            comic.ComicOwner,
                            margin: MAR_PAD_0,
                          )
                        : ContentTextA(
                            "",
                            margin: MAR_PAD_0,
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(
          vertical: marginVertical, horizontal: marginHorizantal),
    ));
  }
}

class ComicMiniCardPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: COLOR_D_LIGHT_6,
        highlightColor: COLOR_E_HEAVY_2,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(BORDER_RADIUS_3)),
          height: 190,
          width: 140,
          padding: EdgeInsets.all(MAR_PAD_2),
          margin: EdgeInsets.symmetric(horizontal: MAR_PAD_2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: MAR_PAD_3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: COLOR_D_LIGHT_6,
                ),
                height: 160,
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: MAR_PAD_1),
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: COLOR_D_LIGHT_6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: MAR_PAD_1),
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      color: COLOR_D_LIGHT_6,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
