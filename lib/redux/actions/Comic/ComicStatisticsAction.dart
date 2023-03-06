import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicStatisticsModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum ComicStatisticsActions {
  COMIC_STATISTICS_LOADING,
  COMIC_STATISTICS_LOADED,
  COMIC_STATISTICS_ERROR
}

//objects
class IsComicStatisticsLoadingObject {
  ComicStatisticsActions type;
  bool isLoading;

  IsComicStatisticsLoadingObject(this.isLoading, this.type);
}

class ComicStatisticsLoadingErrorObject {
  ComicStatisticsActions type;
  bool isError;

  ComicStatisticsLoadingErrorObject(this.isError, this.type);
}

class ComicStatisticsLoadedObject {
  ComicStatisticsActions type;
  ComicStatisticsModel comicStatisticsModel;

  ComicStatisticsLoadedObject(this.comicStatisticsModel, this.type);
}

//types functions
IsComicStatisticsLoadingObject IsComicStatisticsLoading(bool isLoading) {
  var obj = IsComicStatisticsLoadingObject(
      isLoading, ComicStatisticsActions.COMIC_STATISTICS_LOADING);
  return obj;
}

ComicStatisticsLoadingErrorObject ComicStatisticsLoadingError(bool isError) {
  var obj = ComicStatisticsLoadingErrorObject(
      isError, ComicStatisticsActions.COMIC_STATISTICS_ERROR);
  return obj;
}

ComicStatisticsLoadedObject ComicStatisticsLoaded(
    ComicStatisticsModel comicStatisticsModel) {
  var obj = ComicStatisticsLoadedObject(
      comicStatisticsModel, ComicStatisticsActions.COMIC_STATISTICS_LOADED);

  return obj;
}

//actions
dynamic GetComicStatistics(String comicId) {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsComicStatisticsLoading(true));

    ComicStatisticsModel model;

    try {
      var comicStatistics = await FirebaseFirestore.instance
          .collection("comicstatistics")
          .where("ComicId", isEqualTo: comicId)
          .limit(1)
          .get();

      if (comicStatistics.docs.isNotEmpty) {
        String chapter = comicStatistics.docs.first.get("Chapter");
        String language = comicStatistics.docs.first.get("Language");
        String rating = comicStatistics.docs.first.get("Rating");

        model = ComicStatisticsModel(rating, chapter, language);
        store.dispatch(ComicStatisticsLoaded(model));
      } else {
        store.dispatch(ComicStatisticsLoadingError(true));
      }
    } catch (e) {
      store.dispatch(ComicStatisticsLoadingError(true));
    }
  };
}
