import 'package:comic_mobile_app/models/Comic/ComicStatisticsModel.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InfoCard extends StatelessWidget {
  final ComicStatisticsModel comicStatisticsModel;

  InfoCard(this.comicStatisticsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: MAR_PAD_2, vertical: MAR_PAD_3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_7),
          color: COLOR_E_HEAVY_2,
          boxShadow: [
            BoxShadow(
              color: COLOR_E_HEAVY,
              blurRadius: 10,
              offset: Offset(-8, 8),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 90,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  comicStatisticsModel.Rating,
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Rating",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  comicStatisticsModel.Chapter,
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Chapter",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  comicStatisticsModel.Language,
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Language",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            )
          ],
        ));
  }
}

class InfoCardPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: COLOR_D_LIGHT_6,
      highlightColor: COLOR_E_HEAVY_2,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: MAR_PAD_2, vertical: MAR_PAD_3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BORDER_RADIUS_7),
          color: COLOR_E_HEAVY_2,
          boxShadow: [
            BoxShadow(
              color: COLOR_E_HEAVY,
              blurRadius: 10,
              offset: Offset(-8, 8),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: MAR_PAD_2),
                  decoration: BoxDecoration(
                    color: COLOR_D_LIGHT_6,
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
                  ),
                  height: 40,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MAR_PAD_2),
                  decoration: BoxDecoration(
                    color: COLOR_D_LIGHT_6,
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
                  ),
                  height: 40,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
