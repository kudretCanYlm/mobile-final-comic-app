import 'package:comic_mobile_app/models/Comic/ComicModels.dart';
import 'package:comic_mobile_app/pages/ComicReview.dart';
import 'package:comic_mobile_app/widgets/card/ContinueReadingCard.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

Future ContinueReadingModal(
    BuildContext context, ComicCardContiuneReadingModel comicContiune) {
  return showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BORDER_RADIUS_5),
          topRight: Radius.circular(BORDER_RADIUS_5),
        ),
      ),
      elevation: 5,
      builder: (BuildContext context) {
        return Container(
          height: 190,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "lib/assets/bg-images/Mountain_Range_Background.jpg"),
                  fit: BoxFit.none,
                  scale: 2,
                  colorFilter:
                      ColorFilter.mode(COLOR_B_LIGHT_3, BlendMode.colorBurn),
                  opacity: 0.15)),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.linear_scale_outlined,
                  color: COLOR_E_HEAVY_2,
                  size: FONT_SIZE_15,
                ),
              ),
              Expanded(
                flex: 20,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MAR_PAD_1,
                      horizontal: MAR_PAD_2,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTypeA(
                          "Continue Reading",
                          color: COLOR_E_HEAVY_2,
                          textAlign: TextAlign.left,
                          fontSize: FONT_SIZE_9,
                        ),
                        ContinueReadingCard(comicContiune)
                      ],
                    )),
              )
            ],
          ),
        );
      });
}
