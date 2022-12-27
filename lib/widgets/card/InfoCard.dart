import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
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
                color:COLOR_E_HEAVY,
                blurRadius: 10,
                offset: Offset(-8,8)
              )
            ]),

        //  Genişlik
        width: 500,
        //  Yükseklik
        height: 140,
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
                Text("4.5/5",style: TextStyle(fontSize: 40,wordSpacing: 5)),
                Text("Rating",style: TextStyle(color:COLOR_F_LOS,fontWeight:FONT_WEIGHT_5)),
              ],
            ),

            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("265",style: TextStyle(fontSize: 40,wordSpacing: 5)),
                Text("Chapter",style: TextStyle(color:COLOR_F_LOS,fontWeight:FONT_WEIGHT_5 )),
              ],
            ),

            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Eng",style: TextStyle(fontSize: 40,wordSpacing: 5)),
                Text("Language",style: TextStyle(color:COLOR_F_LOS,fontWeight:FONT_WEIGHT_5)),
              ],
            )
          ],
        ));
  }
}
