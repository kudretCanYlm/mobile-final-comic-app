import 'dart:async';
import 'dart:io';

import 'package:comic_mobile_app/widgets/common/BorderRadiusCommon.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontSizeCommon.dart';
import 'package:comic_mobile_app/widgets/common/FontWeightCommon.dart';
import 'package:comic_mobile_app/widgets/common/MarginPaddingCommon.dart';
import 'package:comic_mobile_app/widgets/texts/titles/TitleTypeA.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfReadPage extends StatefulWidget {
  final String? path;

  const PdfReadPage({Key? key, this.path}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PdfReadPage> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('lib/assets/batman.pdf', 'batman.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BORDER_RADIUS_2,
          ),
        ),
        backgroundColor: COLOR_E_HEAVY_2,
        elevation: 1,
        actions: [
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(MAR_PAD_3),
            child: GestureDetector(
              onTap: () {
                //  SettingsModal(context);
              },
              child: Icon(
                Icons.menu,
                color: COLOR_D_HEAVY,
                size: FONT_SIZE_13,
              ),
            ),
          )
        ],
        leading: Container(
            child: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: COLOR_D_HEAVY,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTypeA(
              "The Joker",
              fontWeight: FONT_WEIGHT_4,
              fontSize: FONT_SIZE_7,
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            fitEachPage: true,
            fitPolicy: FitPolicy.BOTH,
            pageFling: true,
            swipeHorizontal: true,
            filePath: widget.path,
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
    );
  }
}
