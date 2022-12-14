import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IconButtonTypeA extends StatefulWidget {
  final double margin;
  final double size;
  final void Function(String) callBack;
  final String text;
  final String id;
  final IconData icon;
  final Color nonSelectBackColor;
  final Color selectedBackColor;
  final Color selectedColor;
  final Color nonSelectedColor;
  final double fontSize;
  final double padding;

  IconButtonTypeA(this.text, this.id, this.icon, this.callBack,
      {this.margin = MAR_PAD_0,
      this.size = 70,
      this.nonSelectBackColor = Colors.white,
      this.selectedBackColor = COLOR_B_HEAVY,
      this.selectedColor = Colors.white,
      this.nonSelectedColor = COLOR_D_HEAVY,
      this.fontSize = FONT_SIZE_5,
      this.padding = MAR_PAD_1});

  @override
  State<StatefulWidget> createState() => _IconButtonTypeAState();
}

class _IconButtonTypeAState extends State<IconButtonTypeA> {
  bool isSelected = false;
  Color? backColor;
  Color? color;

  @override
  void initState() {
    isSelected = false;
    backColor = widget.nonSelectBackColor;
    color = widget.nonSelectedColor;
    super.initState();
  }

  void selectedControl() {
    widget.callBack(widget.id);

    if (isSelected) {
      setState(() {
        backColor = widget.nonSelectBackColor;
        color = widget.nonSelectedColor;
        isSelected = false;
      });
    } else {
      setState(() {
        backColor = widget.selectedBackColor;
        color = widget.selectedColor;
        isSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.margin),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: COLOR_E_HEAVY),
          borderRadius: BorderRadius.circular(BORDER_RADIUS_3)),
      child: ElevatedButton(
        onPressed: selectedControl,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                widget.icon,
                color: color,
                size: widget.fontSize * 2,
              ),
              Text(
                widget.text,
                style: TextStyle(color: color, fontSize: widget.fontSize),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          //padding: EdgeInsets.fromLTRB(paddingHorizantal, paddingVertical,paddingHorizantal, paddingVertical),
          minimumSize: Size(widget.size, widget.size),
          padding: EdgeInsets.all(widget.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS_3),
          ),
        ),
      ),
    );
  }
}
