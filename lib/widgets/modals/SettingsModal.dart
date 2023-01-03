import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeB.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/material.dart';

Future SettingsModal(BuildContext context) {
  return showModalBottomSheet<void>(
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BORDER_RADIUS_5),
          topRight: Radius.circular(BORDER_RADIUS_5)),
    ),
    elevation: 5,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 350,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                Icons.linear_scale_outlined,
                color: COLOR_D_LIGHT_2,
                size: FONT_SIZE_15,
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.only(left: MAR_PAD_4),
                margin: EdgeInsets.only(top: MAR_PAD_0),
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    TextButtonTypeB(
                      "Settings",
                      () {},
                      fontSize: FONT_SIZE_9,
                      textAlign: TextAlign.left,
                    ),
                    TextButtonTypeB("Liked", () {}, fontSize: FONT_SIZE_9),
                    TextButtonTypeB("Share my profile", () {},
                        fontSize: FONT_SIZE_9),
                    TextButtonTypeB("QR Code", () {}, fontSize: FONT_SIZE_9),
                    TextButtonTypeB("Fovourites", () {}, fontSize: FONT_SIZE_9),
                    TextButtonTypeB("Archive", () {}, fontSize: FONT_SIZE_9),
                    TextButtonTypeB("Log Out", () {}, fontSize: FONT_SIZE_9),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
