import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:comic_mobile_app/models/Comic/ComicDataModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';

enum ComicDataActions {
  SET_COMIC_DATA_LIST,
}

//objects
class SetComicDataListObject {
  List<ComicDataModel> models;
  ComicDataActions type;

  SetComicDataListObject(this.models, this.type);
}

//types functions
SetComicDataListObject SetComicDataList(List<ComicDataModel> models) {
  var obj =
      SetComicDataListObject(models, ComicDataActions.SET_COMIC_DATA_LIST);
  return obj;
}

//action

dynamic DeleteComicData() {
  return (Store<AppReducerState> store) async {
    store.dispatch(SetComicDataList([]));
  };
}

dynamic DeleteComicById(String comicId) {
  return (Store<AppReducerState> store) async {
    //control

    var comicData = store.state.comicDataReducerState!.comicData;

    if (comicData.any((data) => data.ComicId == comicId)) {
      comicData.removeWhere((data) => data.ComicId == comicId);
      store.dispatch(SetComicDataList(comicData));
    }
  };
}

dynamic SetComicDownland(String comicId) {
  return (Store<AppReducerState> store) async {
    //control comic

    if (!store.state.comicDataReducerState!.comicData
        .any((element) => element.ComicId == comicId)) {
      FirebaseStorage storage = FirebaseStorage.instance;

      var dowUrl = await storage.ref("$comicId.pdf").getDownloadURL();

      var response =
          await http.Client().send(http.Request("GET", Uri.parse(dowUrl)));

      var newComic = ComicDataModel(comicId, response.contentLength ?? 0);

      //set comic list
      var newList = store.state.comicDataReducerState!.comicData;

      newList.add(newComic);
      int received = 0;
      List<int> data = [];
      String lastPercent = "";
      response.stream.listen((value) {
        data.addAll(value);
        received += value.length;
        String percent = newList
            .firstWhere((element) => element.ComicId == comicId)
            .calculatePercent(received);

        // ignore: unrelated_type_equality_checks
        if (percent != lastPercent) {
          lastPercent = percent;
          store.dispatch(SetComicDataList(newList));
        }
      }).onDone(() async {
        newList
            .firstWhere((element) => element.ComicId == comicId)
            .comicSaving();
        store.dispatch(SetComicDataList(newList));
        writeComicData(data, comicId).then((value) {
          newList
              .firstWhere((element) => element.ComicId == comicId)
              .comicSaved();
          store.dispatch(SetComicDataList(newList));
          print("dosya kaydedildi");
        });
      });
    }
  };
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> _localFile(String comicId) async {
  final path = await _localPath;
  return File('$path/comicData_$comicId.json');
}

Future<File> writeComicData(List<int> data, String comicId) async {
  final file = await _localFile(comicId);

  // Write the file
  return file.writeAsBytes(data);
}

Future<String> readComicDataPath(String comicId) async {
  File file = await _localFile(comicId);
  return file.path;
}
