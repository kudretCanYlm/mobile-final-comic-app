import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  final String hintText;
  final double margin;
  final double contentPadding;
  final Color hintColor;
  final Color inputcolor;
  final double fontSize;
  final bool obscureText;
  final TextAlign textAlign;
  final void Function(String) textChange;

  InputTextBox(
    this.hintText,
    this.textChange, {
    this.margin = 15,
    this.contentPadding = 5,
    this.hintColor = COLOR_D_LIGHT_2,
    this.fontSize = FONT_SIZE_8,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.inputcolor = COLOR_D_HEAVY,
  });

  @override
  Widget build(Object context) {
    return Container(
      child: TextField(
        onChanged: (text) {
          textChange(text);
        },
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FONT_WEIGHT_5,
          color: hintColor,
          letterSpacing: LETTER_SPACING_5,
        ),
        obscureText: obscureText,
        textAlign: textAlign,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            focusColor: COLOR_B_HEAVY,
            fillColor: COLOR_B_HEAVY,
            hoverColor: COLOR_B_HEAVY,
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FONT_WEIGHT_5,
              color: hintColor,
              fontSize: fontSize,
              letterSpacing: LETTER_SPACING_7,
            ),
            contentPadding: EdgeInsets.only(
              left: contentPadding,
              right: contentPadding,
            )),
      ),
      margin: EdgeInsets.all(margin),
    );
  }
}
