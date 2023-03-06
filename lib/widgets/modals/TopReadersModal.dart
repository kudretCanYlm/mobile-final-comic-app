import 'package:comic_mobile_app/models/User/UserModelA.dart';
import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';
import '../card/UserMicroCard.dart';

Future TopReadersModal(BuildContext context, List<UserModelA> userlist) {
  return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BORDER_RADIUS_5),
          topRight: Radius.circular(BORDER_RADIUS_5),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 330,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [COLOR_A_LIGHT_2, COLOR_A_LIGHT_3, COLOR_C_LIGHT_2],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.linear_scale_outlined,
                  color: COLOR_E_HEAVY_2,
                  size: FONT_SIZE_15,
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: MAR_PAD_4),
                    margin: EdgeInsets.only(
                      top: MAR_PAD_0,
                    ),
                    width: double.infinity,
                    child: TitleTypeA(
                      "Top Readers",
                      textAlign: TextAlign.left,
                      color: COLOR_E_HEAVY_2,
                      fontSize: FONT_SIZE_9,
                    ),
                  )),
              Expanded(
                flex: 15,
                child: Container(
                  padding: EdgeInsets.only(left: MAR_PAD_4),
                  margin: EdgeInsets.only(top: MAR_PAD_0),
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: userlist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return UserMicroCard(userlist[index]);
                      }),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: MAR_PAD_4),
                    margin: EdgeInsets.only(
                      top: MAR_PAD_0,
                    ),
                    width: double.infinity,
                    child: TitleTypeA(
                      "Top Comics",
                      textAlign: TextAlign.left,
                      color: COLOR_E_HEAVY_2,
                      fontSize: FONT_SIZE_9,
                    ),
                  )),
              Expanded(
                flex: 15,
                child: Container(
                  padding: EdgeInsets.only(left: MAR_PAD_4),
                  margin: EdgeInsets.only(top: MAR_PAD_0),
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: userlist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return UserMicroCard(userlist[index]);
                      }),
                ),
              ),
            ],
          ),
        );
      });
}
