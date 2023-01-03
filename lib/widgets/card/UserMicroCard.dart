import 'dart:convert';

import 'package:comic_mobile_app/models/User/UserModels.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/LetterSpacingCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class UserMicroCard extends StatelessWidget {
  final UserModelA user;
  final double imageSize;
  final double marginRight;

  const UserMicroCard(
    this.user, {
    super.key,
    this.imageSize = 98,
    this.marginRight = MAR_PAD_3,
  });

  void toUserPage() {
    print("user Id ${user.UserId}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: marginRight),
        child: GestureDetector(
          onTap: toUserPage,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: COLOR_E_HEAVY_2, width: 3),
                  borderRadius: BorderRadius.circular(imageSize),
                ),
                child: ClipRRect(
                  child: Image.memory(
                    base64Decode(user.Base64Image),
                    width: imageSize,
                    cacheHeight: imageSize.toInt(),
                    cacheWidth: imageSize.toInt(),
                    height: imageSize,
                  ),
                  borderRadius: BorderRadius.circular(imageSize),
                ),
              ),
              TitleTypeA(
                user.UserName,
                fontWeight: FONT_WEIGHT_5,
                fontSize: FONT_SIZE_5,
                color: COLOR_E_HEAVY_2,
                letterSpacing: LETTER_SPACING_5,
              )
            ],
          ),
        ));
  }
}
