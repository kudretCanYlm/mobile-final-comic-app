import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart';

String ResizeImageFromBase64(String image, int targetwidth, int targetheight) {
  Image imageByte = decodeImage(base64Decode(image))!;

  Image thumbnail =
      copyResize(imageByte, width: targetwidth, height: targetheight);

  return base64Encode(encodePng(thumbnail));
}
