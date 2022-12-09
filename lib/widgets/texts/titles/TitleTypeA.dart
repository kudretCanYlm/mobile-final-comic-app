import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/common/WordSpacingCommon.dart';
import 'package:flutter/material.dart';

class TitleTypeA extends StatelessWidget {
  final String title;
  final double margin;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final String fontFamily;
  final Color color;
  final double wordSpacing;
  final TextAlign textAlign;

  TitleTypeA(this.title,
      {this.margin = MAR_PAD_1,
      this.fontSize = FONT_SIZE_10,
      this.fontWeight = FONT_WEIGHT_5,
      this.letterSpacing = LETTER_SPACING_7,
      this.fontFamily = FONT_FAMILY_A,
      this.color = COLOR_D_LIGHT,
      this.wordSpacing = WORD_SPACING_3,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          color: color,
          wordSpacing: wordSpacing,
        ),
      ),
    );
  }
}
