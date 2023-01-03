import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/common/WordSpacingCommon.dart';
import 'package:flutter/material.dart';

class ContentTextA extends StatelessWidget {
  final String text;
  final double margin;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final String fontFamily;
  final Color color;
  final double wordSpacing;
  final TextAlign textAlign;

  ContentTextA(this.text,
      {super.key,
      this.margin = MAR_PAD_1,
      this.fontSize = FONT_SIZE_8,
      this.fontWeight = FONT_WEIGHT_3,
      this.letterSpacing = LETTER_SPACING_1,
      this.color = COLOR_D_LIGHT_2,
      this.fontFamily = FONT_FAMILY_B,
      this.textAlign = TextAlign.start,
      this.wordSpacing = WORD_SPACING_1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
          overflow: TextOverflow.fade,
          color: color,
        ),
      ),
    );
  }
}
