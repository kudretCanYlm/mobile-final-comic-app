import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: COLOR_E_HEAVY,
              blurRadius: 10,
              offset: Offset(-8, 8),
            )
          ],
        ),

        //  Genişlik
        width: MediaQuery.of(context).size.width * 0.8,
        //  Yükseklik
        height: 90,
        //  Renk
        //color: COLOR_E_HEAVY,
        //  Hizalama
        alignment: Alignment.center,
        //  İçten boşluk

        //  Dıştan boşluk
        margin: EdgeInsets.symmetric(vertical: MAR_PAD_3),
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
                  "4.5/5",
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Rating",
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
                Text("Chapter",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTypeA(
                  "Eng",
                  fontSize: FONT_SIZE_10,
                  fontWeight: FONT_WEIGHT_4,
                ),
                Text("Language",
                    style: TextStyle(
                        color: COLOR_F_LOS, fontWeight: FONT_WEIGHT_5)),
              ],
            )
          ],
        ));
  }
}
