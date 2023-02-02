import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class InfoCardNoBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white,
        ),

        //  Genişlik
        width: MediaQuery.of(context).size.width * 0.8,

        //  Renk
        //color: COLOR_E_HEAVY,
        //  Hizalama
        alignment: Alignment.center,
        //  İçten boşluk
        padding: EdgeInsets.all(10),
        //  Dıştan boşluk
        margin: EdgeInsets.all(20),
        //  Container içerisine
        //  child: parametresi ile başka herhangi bir widget eklenebilir,
        //  o widget Container içerisinde görüntülenir.

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  "24",
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Review",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  "265",
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                // Text("265", style: TextStyle(fontSize: 25, wordSpacing: 5)),
                Text("Followers",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  "1.5k",
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Likes",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            )
          ],
        ));
  }
}
