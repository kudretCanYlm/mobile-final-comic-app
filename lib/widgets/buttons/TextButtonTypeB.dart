import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:flutter/material.dart';

class TextButtonTypeB extends StatelessWidget {
  final String buttonText;
  final double margin;
  final Color textColor;
  final VoidCallback callBack;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  // ignore: prefer_const_constructors_in_immutables
  TextButtonTypeB(this.buttonText, this.callBack,
      {super.key,
      this.margin = 0,
      this.textColor = COLOR_D_HEAVY,
      this.fontSize = FONT_SIZE_8,
      this.fontWeight = FONT_WEIGHT_4,
      this.letterSpacing = LETTER_SPACING_2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: TextButton(
        onPressed: callBack,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
