import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/material.dart';

class TextButtonTypeA extends StatelessWidget {
  final String buttonText;
  final VoidCallback callBack;
  final double margin;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final String fontfamily;
  final FontWeight fontWeight;
  final double size;
  final double paddingHorizantal;
  final double paddingVertical;
  final double borderRadius;

  TextButtonTypeA(this.buttonText, this.callBack,
      {this.margin = MAR_PAD_0,
      this.backgroundColor = COLOR_B_HEAVY,
      this.textColor = COLOR_E_HEAVY,
      this.fontSize = FONT_SIZE_5,
      this.fontfamily = FONT_FAMILY_A,
      this.fontWeight = FONT_WEIGHT_4,
      this.size = 0,
      this.paddingHorizantal = MAR_PAD_4,
      this.paddingVertical = MAR_PAD_3,
      this.borderRadius = BORDER_RADIUS_3,
      super.key});

  @override
  Widget build(Object context) {
    return Container(
        margin: EdgeInsets.all(margin),
        child: SizedBox(
          width: size == 0 ? double.maxFinite : size,
          child: ElevatedButton(
            onPressed: callBack,
            child: Text(
              buttonText,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontfamily,
                color: textColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: EdgeInsets.fromLTRB(paddingHorizantal, paddingVertical,
                  paddingHorizantal, paddingVertical),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ));
  }
}
