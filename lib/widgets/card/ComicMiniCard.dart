import 'dart:convert';
import 'package:comic_mobile_app/models/Comic/ComicModels.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

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
        onTap: () => callback(comic.ComicId),
        child: Container(
          padding: EdgeInsets.all(MAR_PAD_1),
          width: cardwidth,
          height: cardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(MAR_PAD_1),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: COLOR_F_HEAVY,
                      blurRadius: 30,
                      offset: Offset(0, 0))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(imageBorderRadius),
                  child: Image.memory(
                    base64Decode(comic.ImageBase64),
                    fit: BoxFit.cover,
                    height: imageHeight,
                    cacheHeight: imageHeight.toInt(),
                    width: double.infinity,
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
