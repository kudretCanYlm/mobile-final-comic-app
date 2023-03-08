import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future CircleLoadingModal(BuildContext context) {
  return showCupertinoModalBottomSheet(
      expand: true,
      enableDrag: false,
      useRootNavigator: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const WillPopScope(
            onWillPop: _onWillPop,
            child: Center(
              child: CircularProgressIndicator(
                color: COLOR_B_LIGHT,
              ),
            ),
          ));
}

Future<bool> _onWillPop() async {
  return false; //<-- SEE HERE
}
