import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  final double size;
  final String defaultImageUrl;
  final String base64Image;

  const ImageUpload(
      {super.key,
      this.size = 130,
      this.defaultImageUrl =
          "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
      this.base64Image =
          "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"});

  @override
  State<StatefulWidget> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  XFile? imageFile;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter

  @override
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      imageFile = img;
    });
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
                child: imageFile != null
                    ? Image.file(
                        File(imageFile!.path),
                        height: widget.size,
                        width: widget.size,
                        fit: BoxFit.cover,
                      )
                    : widget.base64Image.length == 0
                        ? Image.network(
                            widget.defaultImageUrl,
                            height: widget.size,
                            width: widget.size,
                            fit: BoxFit.cover,
                          )
                        : Image.memory(
                            base64Decode(widget.base64Image),
                            height: widget.size,
                            width: widget.size,
                            fit: BoxFit.cover,
                          ),
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(100),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: CircleAvatar(
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () => getImage(ImageSource.gallery),
                    icon: Icon(
                      Icons.add,
                      size: FONT_SIZE_13,
                      color: COLOR_E_HEAVY,
                    ),
                  ),
                  backgroundColor: COLOR_A_LIGHT,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
