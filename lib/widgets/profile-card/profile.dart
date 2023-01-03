import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      

        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [const Image(
  image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png',scale: 5),
)
              ],
            ),
Container(
  margin: EdgeInsets.only(left: 15),
child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                Text("Kullanıcı",style: TextStyle(color:COLOR_F_LOS,fontWeight:FONT_WEIGHT_5, )),
                Text("Hüseyin Kardeş",style: TextStyle(fontSize: 25,wordSpacing: 5)),
                
              ],
            ),
)

          ],
        ));
  }
}
