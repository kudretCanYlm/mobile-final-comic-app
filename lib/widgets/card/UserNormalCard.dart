import 'dart:convert';

import 'package:comic_mobile_app/models/User/UserModelB.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class UserNormalCard extends StatelessWidget {
  final UserModelB user;
  final double margin;

  const UserNormalCard(
    this.user, {
    super.key,
    this.margin = MAR_PAD_1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: MAR_PAD_3),
            width: 90,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: COLOR_E_HEAVY_2,
                border: Border.all(color: COLOR_E_HEAVY, width: 3),
                boxShadow: [
                  BoxShadow(
                      color: COLOR_E_LIGHT,
                      blurRadius: 15,
                      offset: Offset(0, 0))
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: Image.memory(
                base64Decode(user.Base64Image),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTypeA(
                user.UserName,
                color: COLOR_D_LIGHT,
                fontSize: FONT_SIZE_10,
                fontWeight: FONT_WEIGHT_4,
              ),
              ContentTextA(user.RealName),
            ],
          )
        ],
      ),
    );
  }
}
