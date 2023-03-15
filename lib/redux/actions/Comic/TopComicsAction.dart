import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicModelA.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum TopComicsActions {
  TOP_COMICS_LOADING,
  TOP_COMICS_ERROR,
  TOP_COMICS,
}

//objects
class IsTopComicsLoadingObject {
  TopComicsActions type;
  bool isLoading;

  IsTopComicsLoadingObject(this.isLoading, this.type);
}

class TopComicsLoadingErrorObject {
  TopComicsActions type;
  bool isError;

  TopComicsLoadingErrorObject(this.isError, this.type);
}

class TopComicsLoadedObject {
  TopComicsActions type;
  List<ComicModelA> topComicList;

  TopComicsLoadedObject(this.topComicList, this.type);
}

//types functions
IsTopComicsLoadingObject IsTopComicsLoading(bool isLoading) {
  var obj =
      IsTopComicsLoadingObject(isLoading, TopComicsActions.TOP_COMICS_LOADING);
  return obj;
}

TopComicsLoadingErrorObject TopComicsLoadingError(bool isError) {
  var obj =
      TopComicsLoadingErrorObject(isError, TopComicsActions.TOP_COMICS_ERROR);
  return obj;
}

TopComicsLoadedObject TopComicsLoaded(List<ComicModelA> topComicList) {
  var obj = TopComicsLoadedObject(topComicList, TopComicsActions.TOP_COMICS);
  return obj;
}

//actions
//Get
dynamic GetTopComics() {
  return (Store<AppReducerState> store) async {
    List<ComicModelA> topComicsResult = [];

    store.dispatch(IsTopComicsLoading(true));

    try {
      var topComics = await FirebaseFirestore.instance
          .collection("comic")
          .orderBy("Name")
          .limit(10)
          .get();

      topComics.docs.forEach((topComic) {
        topComicsResult.add(ComicModelA(
          topComic.id,
          topComic.get("Name"),
          topComic.get("Base64Image"),
        ));
      });

      store.dispatch(TopComicsLoaded(topComicsResult));
    } catch (e) {
      store.dispatch(TopComicsLoadingError(true));
    }
  };
}
