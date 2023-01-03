import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/material.dart';

class IconButtonTypeB extends StatelessWidget {
  final Function callBack;
  final String text;
  final IconData icon;
  final double margin;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final Color backColor;
  final double padding;
  final double borderRadius;

  const IconButtonTypeB(
    this.text,
    this.callBack,
    this.icon, {
    this.margin = MAR_PAD_1,
    this.iconColor = COLOR_D_LIGHT_2,
    this.fontSize = FONT_SIZE_6,
    this.textColor = COLOR_D_LIGHT_2,
    this.backColor = COLOR_E_HEAVY_2,
    this.padding = MAR_PAD_2,
    this.borderRadius = BORDER_RADIUS_10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: COLOR_E_HEAVY),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: ElevatedButton(
        onPressed: () {
          callBack();
        },
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: margin),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: fontSize * 2,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          //padding: EdgeInsets.fromLTRB(paddingHorizantal, paddingVertical,paddingHorizantal, paddingVertical),
          //minimumSize: Size(widget.size, widget.size),
          padding: EdgeInsets.all(padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
