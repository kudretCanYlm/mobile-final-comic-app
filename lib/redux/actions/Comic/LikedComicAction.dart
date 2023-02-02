import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicCardLikedModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum LikedComicActions {
  LIKED_COMIC_LOADING,
  LIKED_COMIC_ERROR,
  LIKED_COMIC_LOADED,
}

//objects
class IsLikedComicLoadingObject {
  LikedComicActions type;
  bool isLoading;

  IsLikedComicLoadingObject(this.isLoading, this.type);
}

class LikedComicLoadingErrorObject {
  LikedComicActions type;
  bool isError;

  LikedComicLoadingErrorObject(this.isError, this.type);
}

class LikedComicLoadedObject {
  LikedComicActions type;
  List<ComicCardLikedModel> comics;

  LikedComicLoadedObject(this.comics, this.type);
}

//types functions
IsLikedComicLoadingObject IsLikedComicLoading(bool isLoading) {
  var obj = IsLikedComicLoadingObject(
      isLoading, LikedComicActions.LIKED_COMIC_LOADING);

  return obj;
}

LikedComicLoadingErrorObject LikedComicLoadingError(bool isError) {
  var obj = LikedComicLoadingErrorObject(
      isError, LikedComicActions.LIKED_COMIC_ERROR);

  return obj;
}

LikedComicLoadedObject LikedComicLoaded(List<ComicCardLikedModel> comics) {
  var obj =
      LikedComicLoadedObject(comics, LikedComicActions.LIKED_COMIC_LOADED);

  return obj;
}

//actions
dynamic GetLikedComicList() {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsLikedComicLoading(true));

    try {
      var comics =
          await FirebaseFirestore.instance.collection("likedcomic").get();
      if (comics.docs.isNotEmpty) {
        List<ComicCardLikedModel> comicList = [];

        comics.docs.forEach((comicJson) {
          String comicId = comicJson.id;
          String comicName = comicJson.get("ComicName");
          String comicOwner = comicJson.get("ComicOwner");
          String imageBase64 = comicJson.get("ImageBase64");
          String chapterName = comicJson.get("ChapterName");
          String mark = comicJson.get("Mark");

          var comic = ComicCardLikedModel(
              comicId, comicName, comicOwner, imageBase64, chapterName, mark);
          comicList.add(comic);
        });

        store.dispatch(LikedComicLoaded(comicList));
      } else {
        store.dispatch(LikedComicLoadingError(true));
      }
    } catch (e) {
      store.dispatch(LikedComicLoadingError(true));
    }
  };
}
