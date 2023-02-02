import 'package:comic_mobile_app/widgets/buttons/TextButtonTypeA.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontFamilyCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future NetworkErrorModal(BuildContext context) {
  return showCupertinoModalBottomSheet(
    expand: true,
    enableDrag: false,
    useRootNavigator: false,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.symmetric(horizontal: MAR_PAD_5),
      margin: EdgeInsets.symmetric(vertical: MAR_PAD_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.network_wifi_1_bar_outlined,
            size: FONT_SIZE_BIG_10,
            color: COLOR_B_LIGHT,
          ),
          TitleTypeA(
            "Oh No!",
            fontSize: FONT_SIZE_14,
            fontFamily: FONT_FAMILY_C ?? FONT_FAMILY_A,
          ),
          ContentTextA(
            "No internet found.Check your connection or try again",
            textAlign: TextAlign.center,
            margin: MAR_PAD_3,
          ),
          TextButtonTypeA("Back To Page", margin: MAR_PAD_3, () {
            Navigator.of(context)
                .popUntil((route) => route.settings.name == '/');
          })
        ],
      ),
    ),
  );
}
