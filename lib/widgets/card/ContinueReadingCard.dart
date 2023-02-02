import 'dart:convert';
import 'package:comic_mobile_app/pages/ComicReview.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import '../../models/Comic/ComicModels.dart';

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
              Navigator.of(context).push(_createRoute());
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ComicReview(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
