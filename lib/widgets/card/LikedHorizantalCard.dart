import 'dart:convert';
import 'package:comic_mobile_app/models/Comic/ComicCardLikedModel.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LikedHorizantalCard extends StatelessWidget {
  final ComicCardLikedModel comicCardlikedModel;
  final double width;
  final double height;
  final double imageSizeH;
  final double imageSizeW;
  final double radius;

  const LikedHorizantalCard(this.comicCardlikedModel,
      {super.key,
      this.imageSizeH = 170,
      this.imageSizeW = 120,
      this.radius = BORDER_RADIUS_5,
      this.width = 310,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: height,
        constraints: BoxConstraints(minHeight: 160, maxHeight: 200),
        margin: EdgeInsets.only(
            bottom: MAR_PAD_2, left: MAR_PAD_2, right: MAR_PAD_2),
        decoration: BoxDecoration(
          color: COLOR_E_HEAVY_2,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: COLOR_D_LIGHT_4,
              blurRadius: 1,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            shadowColor: COLOR_D_HEAVY,
            padding: EdgeInsets.symmetric(
                vertical: MAR_PAD_3, horizontal: MAR_PAD_3),
            backgroundColor: COLOR_E_HEAVY_2, // <-- Button color
            foregroundColor: COLOR_E_HEAVY, // <-- Splash color
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(radius / 2),
                    clipBehavior: Clip.hardEdge,
                    child: Image.memory(
                      base64Decode(comicCardlikedModel.ImageBase64),
                      height: imageSizeH,
                      width: imageSizeW,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
                    margin: EdgeInsets.only(left: MAR_PAD_2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTypeA(
                              comicCardlikedModel.ComicName,
                              fontSize: FONT_SIZE_10,
                              margin: MAR_PAD_1,
                              textAlign: TextAlign.left,
                              fontFamily: FONT_FAMILY_C.toString(),
                            ),
                            ContentTextA(
                              comicCardlikedModel.ComicOwner,
                              fontSize: FONT_SIZE_6,
                              fontWeight: FONT_WEIGHT_5,
                              margin: MAR_PAD_1,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContentTextA(
                              comicCardlikedModel.Mark,
                              fontSize: FONT_SIZE_5,
                              fontWeight: FONT_WEIGHT_4,
                            ),
                            ContentTextA(
                              comicCardlikedModel.ChapterName,
                              fontSize: FONT_SIZE_5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class LikedHorizantalCardPlaceHolder extends StatelessWidget {
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
          padding: EdgeInsets.all(MAR_PAD_2),
          margin: EdgeInsets.symmetric(horizontal: MAR_PAD_2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: MAR_PAD_3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: COLOR_D_LIGHT_6,
                ),
                height: 160,
                width: 110,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MAR_PAD_2),
                child: Column(
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: MAR_PAD_1),
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                        color: COLOR_D_LIGHT_6,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: MAR_PAD_1),
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        color: COLOR_D_LIGHT_6,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
