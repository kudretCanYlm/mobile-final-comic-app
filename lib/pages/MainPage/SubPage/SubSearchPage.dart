import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/inputs/textboxes/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubSearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubSearchPageState();
  const SubSearchPage({Key? key}) : super(key: key);
}

class _SubSearchPageState extends State<SubSearchPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: COLOR_G_HEAVY,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(BORDER_RADIUS_1),
                    bottomRight: Radius.circular(BORDER_RADIUS_1),
                  )),
              child: InputTextBox(
                "Search",
                (te) => print(te),
                (value) {},
                borderColor: COLOR_G_HEAVY,
                hintColor: COLOR_E_HEAVY_2,
                inputcolor: COLOR_E_HEAVY_2,
                margin: MAR_PAD_3,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 1,
                  children: [
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                    Image.network(
                      "https://cdn.theatlantic.com/media/img/photo/2020/02/photos-superb-owl-sunday-iv/s01_1103328920/main_1500.jpg",
                      width: 200,
                      height: 150,
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
