import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicCardModelA.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum ComicActions {
  COMIC_LOADING,
  COMIC_ERROR,
  COMIC_LOADED,
}

//objects
class IsComicLoadingObject {
  ComicActions type;
  bool isLoading;

  IsComicLoadingObject(this.isLoading, this.type);
}

class ComicLoadingErrorObject {
  ComicActions type;
  bool isError;

  ComicLoadingErrorObject(this.isError, this.type);
}

class ComicLoadedObject {
  ComicActions type;
  List<ComicCardModelA> comics;

  ComicLoadedObject(this.comics, this.type);
}

//types functions
IsComicLoadingObject IsComicLoading(bool isLoading) {
  var obj = IsComicLoadingObject(isLoading, ComicActions.COMIC_LOADING);

  return obj;
}

ComicLoadingErrorObject ComicLoadingError(bool isError) {
  var obj = ComicLoadingErrorObject(isError, ComicActions.COMIC_ERROR);

  return obj;
}

ComicLoadedObject ComicLoaded(List<ComicCardModelA> comics) {
  var obj = ComicLoadedObject(comics, ComicActions.COMIC_LOADED);

  return obj;
}

//actions
dynamic GetComicList() {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsComicLoading(true));

    try {
      var comics = await FirebaseFirestore.instance.collection("comic").get();

      if (comics.docs.isNotEmpty) {
        List<ComicCardModelA> comiclist = [];

        comics.docs.forEach((comicJson) {
          String comicId = comicJson.id;
          String comicName = comicJson.get("Name");
          String base64Image = comicJson.get("Base64Image");

          var comic = ComicCardModelA(comicId, comicName, base64Image, "Test");
          comiclist.add(comic);
        });

        store.dispatch(ComicLoaded(comiclist));
      } else {
        store.dispatch(ComicLoadingError(true));
      }
    } catch (e) {
      store.dispatch(ComicLoadingError(true));
    }
  };
}
