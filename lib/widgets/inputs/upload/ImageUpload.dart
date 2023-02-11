import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/ImagesCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  final double size;
  final String defaultImageUrl;
  final String base64Image;
  final Color iconBackgroundColor;
  final Color iconForegroundColor;
  final Function(String base64) callBack;

  const ImageUpload(this.callBack,
      {super.key,
      this.size = 130,
      this.defaultImageUrl =
          "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
      this.base64Image = PROFILE_IMAGE,
      this.iconBackgroundColor = COLOR_B_HEAVY,
      this.iconForegroundColor = COLOR_A_HEAVY});

  @override
  State<StatefulWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  XFile? imageFile;
  String base64 = "";
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter

  @override
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      imageFile = img;
    });
    base64 = base64Encode(await imageFile!.readAsBytes());
    widget.callBack(base64);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                // ignore: sort_child_properties_last
                child: imageFile != null
                    ? Image.file(
                        File(imageFile!.path),
                        height: widget.size,
                        width: widget.size,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      )
                    : widget.base64Image.length == 0
                        ? Image.network(
                            widget.defaultImageUrl,
                            height: widget.size,
                            width: widget.size,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          )
                        : Image.memory(
                            base64Decode(widget.base64Image),
                            height: widget.size,
                            width: widget.size,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          ),
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(100),
              ),
              Positioned(
                right: -5,
                bottom: -5,
                child: ElevatedButton(
                  onPressed: () => getImage(ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(MAR_PAD_1),
                    backgroundColor:
                        widget.iconBackgroundColor, // <-- Button color
                    foregroundColor:
                        widget.iconForegroundColor, // <-- Splash color
                  ),
                  child: const Icon(
                    Icons.add,
                    color: COLOR_E_HEAVY_2,
                    size: FONT_SIZE_10,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
