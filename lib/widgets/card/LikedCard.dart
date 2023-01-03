import 'dart:convert';
import 'package:comic_mobile_app/models/Comic/ComicModels.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class LikedCard extends StatelessWidget {
  final ComicCardLikedModel comicCardlikedModel;
  final double imageSizeH;
  final double imageSizeW;
  final double radius;

  const LikedCard(this.comicCardlikedModel,
      {super.key,
      this.imageSizeH = 140,
      this.imageSizeW = 90,
      this.radius = BORDER_RADIUS_5});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minHeight: 160, maxHeight: 200),
      padding: EdgeInsets.all(MAR_PAD_4),
      margin:
          EdgeInsets.only(bottom: MAR_PAD_2, left: MAR_PAD_2, right: MAR_PAD_2),
      decoration: BoxDecoration(
        color: COLOR_E_HEAVY_2,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: COLOR_E_LIGHT,
            blurRadius: 15,
            offset: Offset(0, 0),
          )
        ],
      ),
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
                  cacheHeight: imageSizeH.toInt(),
                  width: imageSizeW,
                  cacheWidth: imageSizeW.toInt(),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
                height: 150,
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
                          comicCardlikedModel.ComicName + " melih",
                          fontSize: FONT_SIZE_10,
                          margin: MAR_PAD_1,
                          textAlign: TextAlign.left,
                        ),
                        ContentTextA(
                          comicCardlikedModel.ComicOwner,
                          fontSize: FONT_SIZE_6,
                          fontWeight: FONT_WEIGHT_5,
                          margin: MAR_PAD_1,
                        )
                      ],
                    ),
                    ContentTextA(
                      comicCardlikedModel.ChapterName,
                      fontSize: FONT_SIZE_5,
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Icon(Icons.cloud_download, size: FONT_SIZE_12),
              ),
              ContentTextA(
                comicCardlikedModel.Mark,
                fontSize: FONT_SIZE_5,
              )
            ],
          )
        ],
      ),
    );
  }
}
