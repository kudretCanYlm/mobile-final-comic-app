import 'dart:convert';
import 'package:comic_mobile_app/models/Character/CharacterModel.dart';
import 'package:comic_mobile_app/models/Comic/ComicCharacterModel.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharacterCard extends StatelessWidget {
  final double height;
  final ComicCharacterModel model;

  CharacterCard(
    this.model, {
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MAR_PAD_2),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: MAR_PAD_2),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BORDER_RADIUS_5)),
            child: Image.memory(
              base64Decode(model.CharacterBase64Image),
              height: height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTypeA(model.CharacterName, fontSize: FONT_SIZE_8),
              ContentTextA(
                model.CharacterRole,
                fontSize: FONT_SIZE_5,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: MAR_PAD_1),
            child: ContentTextA(
              model.CharacterResume,
              fontSize: FONT_SIZE_5,
              fontWeight: FONT_WEIGHT_4,
            ),
          )
        ],
      ),
    );
  }
}

class CharacterCardPlaceHolder extends StatelessWidget {
  final double height;
  CharacterCardPlaceHolder({
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      //height: 200,
      child: Shimmer.fromColors(
        baseColor: COLOR_D_LIGHT_6,
        highlightColor: COLOR_E_HEAVY_2,
        child: Column(
          children: [
            //image

            Container(
                margin: EdgeInsets.only(bottom: MAR_PAD_2),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: COLOR_D_LIGHT_6,
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_5)),
                height: height * 0.8,
                width: MediaQuery.of(context).size.width),
            //title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: COLOR_D_LIGHT_6,
                      borderRadius: BorderRadius.circular(BORDER_RADIUS_2)),
                  width: 100,
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: COLOR_D_LIGHT_6,
                      borderRadius: BorderRadius.circular(BORDER_RADIUS_2)),
                  width: 80,
                  height: 30,
                ),
              ],
            ),
            //text
            Container(
              decoration: BoxDecoration(
                  color: COLOR_D_LIGHT_6,
                  borderRadius: BorderRadius.circular(BORDER_RADIUS_2)),
              margin: EdgeInsets.only(top: MAR_PAD_1, bottom: MAR_PAD_3),
              width: MediaQuery.of(context).size.width,
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
