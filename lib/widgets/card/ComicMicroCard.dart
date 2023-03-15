import 'dart:convert';
import 'package:comic_mobile_app/models/Comic/ComicModelA.dart';
import 'package:comic_mobile_app/models/User/UserModelA.dart';
import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComicMicroCard extends StatelessWidget {
  final ComicModelA comic;
  final double imageSize;
  final double marginRight;

  const ComicMicroCard(
    this.comic, {
    super.key,
    this.imageSize = 74,
    this.marginRight = MAR_PAD_1,
  });

  void toComicPage(BuildContext context) {
    //Navigator.push(context, comicReviewPageRoute(comic.Id));
    Navigator.push(context, comicReviewPageRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: marginRight),
        child: GestureDetector(
          onTap: () => toComicPage(context),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: COLOR_E_HEAVY_2, width: 3),
                  borderRadius: BorderRadius.circular(imageSize),
                ),
                child: ClipRRect(
                  child: Image.memory(
                    base64Decode(comic.Base64Image),
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(imageSize),
                ),
              ),
              TitleTypeA(
                comic.Name,
                fontWeight: FONT_WEIGHT_5,
                fontSize: FONT_SIZE_5,
                color: COLOR_E_HEAVY_2,
                letterSpacing: LETTER_SPACING_5,
              )
            ],
          ),
        ));
  }
}

class ComicMicroCardPlaceHolder extends StatelessWidget {
  final double imageSize;

  ComicMicroCardPlaceHolder({this.imageSize = 74});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MAR_PAD_1),
      child: Shimmer.fromColors(
        baseColor: COLOR_D_LIGHT_6,
        highlightColor: COLOR_E_HEAVY_2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              margin: EdgeInsets.only(bottom: MAR_PAD_1),
              decoration: BoxDecoration(
                color: COLOR_D_LIGHT_6,
                borderRadius: BorderRadius.circular(BORDER_RADIUS_10),
              ),
            ),
            Container(
              width: imageSize * 0.9,
              height: 20,
              decoration: BoxDecoration(
                color: COLOR_D_LIGHT_6,
                borderRadius: BorderRadius.circular(BORDER_RADIUS_1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
