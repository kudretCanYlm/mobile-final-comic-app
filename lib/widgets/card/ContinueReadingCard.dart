import 'dart:convert';
import 'package:comic_mobile_app/pages/ComicReviewPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/Comic/ComicModels.dart';
import 'package:redux/redux.dart';

class ContinueReadingCard extends StatelessWidget {
  final ComicCardContiuneReadingModel comicContiune;
  final double imageSize;

  const ContinueReadingCard(this.comicContiune,
      {super.key, this.imageSize = 70});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MAR_PAD_3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: COLOR_E_HEAVY_2,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                child: Image.memory(
                  base64Decode(comicContiune.ImageBase64),
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(imageSize),
                clipBehavior: Clip.hardEdge,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTypeA(
                    comicContiune.ComicName,
                    fontSize: FONT_SIZE_9,
                    fontWeight: FONT_WEIGHT_5,
                  ),
                  TitleTypeA(
                    comicContiune.ChapterName,
                    fontSize: FONT_SIZE_6,
                    fontWeight: FONT_WEIGHT_4,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(comicReviewPageRoute());
            },
            icon: Icon(Icons.play_arrow_sharp),
            iconSize: FONT_SIZE_16,
            color: COLOR_D_HEAVY,
          ),
        ],
      ),
    );
  }
}
