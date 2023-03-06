import 'dart:convert';
import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserNormalCardWithInfo extends StatelessWidget {
  final UserModelB? user;
  final double margin;
  final double imageSize;
  final double fontsizeA;
  final double fontsizeB;
  final double padding;
  final VoidCallback callback;

  const UserNormalCardWithInfo(this.user, this.callback,
      {super.key,
      this.margin = MAR_PAD_1,
      this.imageSize = 95,
      this.fontsizeA = FONT_SIZE_5,
      this.fontsizeB = FONT_SIZE_9,
      this.padding = MAR_PAD_2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: Colors.grey,
                border: Border.all(color: COLOR_E_HEAVY, width: 3),
                boxShadow: []),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(9999),
                  child: Image.memory(
                    base64Decode(user!.Base64Image),
                    fit: BoxFit.cover,
                    //width: imageSize,
                    //height: imageSize,
                    //width: imageSize / 9,
                    gaplessPlayback: true,
                  ),
                )),
                Positioned(
                  top: -15,
                  right: -15,
                  child: ElevatedButton(
                    onPressed: () => callback(),
                    //will add notification count
                    child: ContentTextA(
                      "2",
                      color: COLOR_E_HEAVY_2,
                      fontWeight: FONT_WEIGHT_5,
                      fontSize: FONT_SIZE_4,
                      textAlign: TextAlign.center,
                    ),

                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      shape: CircleBorder(),
                      minimumSize: Size(20, 20),
                      backgroundColor: COLOR_A_HEAVY,
                      foregroundColor: COLOR_A_LIGHT,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentTextA(
                user!.RealName,
                fontSize: fontsizeA,
                color: COLOR_E_HEAVY,
              ),
              TitleTypeA(
                user!.UserName,
                color: COLOR_E_HEAVY_2,
                fontSize: fontsizeB,
                fontWeight: FONT_WEIGHT_4,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class UserNormalCardWithInfoPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: COLOR_D_LIGHT_6,
        highlightColor: COLOR_E_HEAVY_2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: COLOR_D_LIGHT_6,
              ),
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(MAR_PAD_1),
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    color: COLOR_D_LIGHT_6,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(MAR_PAD_1),
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: COLOR_D_LIGHT_6,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
