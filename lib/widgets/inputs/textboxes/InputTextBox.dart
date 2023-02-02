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
  final Color borderColor;
  final FontWeight fontweight;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;
  final Function? onSubmit;
  final bool isUnderLineBorder;

  InputTextBox(this.hintText, this.textChange, this.validator,
      {this.margin = 15,
      this.contentPadding = 5,
      this.hintColor = COLOR_D_LIGHT_2,
      this.fontSize = FONT_SIZE_8,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.inputcolor = COLOR_D_HEAVY,
      this.borderColor = COLOR_E_HEAVY_2,
      this.fontweight = FONT_WEIGHT_4,
      this.textInputAction = TextInputAction.next,
      this.onSubmit,
      this.isUnderLineBorder = true});

  @override
  Widget build(Object context) {
    return Container(
      // ignore: sort_child_properties_last
      child: TextFormField(
        validator: validator,
        textInputAction: textInputAction,
        cursorColor: borderColor,
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
            enabledBorder: isUnderLineBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
            focusedBorder: isUnderLineBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
            // border: UnderlineInputBorder(),
            focusColor: COLOR_B_HEAVY,
            fillColor: COLOR_B_HEAVY,
            hoverColor: COLOR_B_HEAVY,
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: fontweight,
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
