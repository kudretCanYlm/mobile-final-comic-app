import 'dart:convert';
import 'package:comic_mobile_app/models/Character/CharacterModel.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final double height;
  final CharacterModel model;

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
              base64Decode(model.base64),
              height: height,
              cacheHeight: height.toInt(),
              width: MediaQuery.of(context).size.width,
              cacheWidth: MediaQuery.of(context).size.width.toInt(),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTypeA(model.character, fontSize: FONT_SIZE_8),
              ContentTextA(
                model.role,
                fontSize: FONT_SIZE_5,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: MAR_PAD_1),
            child: ContentTextA(
              model.detail,
              fontSize: FONT_SIZE_5,
              fontWeight: FONT_WEIGHT_4,
            ),
          )
        ],
      ),
    );
  }
}
