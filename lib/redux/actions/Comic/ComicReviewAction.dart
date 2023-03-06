import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicReviewModel.dart';
import 'package:comic_mobile_app/redux/actions/Comic/ComicAction.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:redux/redux.dart';

enum ComicReviewActions {
  COMIC_REVIEW_LOADING,
  COMIC_REVIEW_LOADED,
  COMIC_REVIEW_ERROR
}

//objects
class IsComicReviewLoadingObject {
  ComicReviewActions type;
  bool isLoading;

  IsComicReviewLoadingObject(this.isLoading, this.type);
}

class ComicReviewLoadingErrorObject {
  ComicReviewActions type;
  bool isError;

  ComicReviewLoadingErrorObject(this.isError, this.type);
}

class ComicReviewLoadedObject {
  ComicReviewActions type;
  ComicReviewModel comicReview;

  ComicReviewLoadedObject(this.comicReview, this.type);
}

//types functions
IsComicReviewLoadingObject IsComicReviewLoading(bool isLoading) {
  var obj = IsComicReviewLoadingObject(
      isLoading, ComicReviewActions.COMIC_REVIEW_LOADING);
  return obj;
}

ComicReviewLoadingErrorObject ComicReviewLoadingError(bool isError) {
  var obj = ComicReviewLoadingErrorObject(
      isError, ComicReviewActions.COMIC_REVIEW_ERROR);
  return obj;
}

ComicReviewLoadedObject ComicReviewLoaded(ComicReviewModel comicReviewModel) {
  var obj = ComicReviewLoadedObject(
      comicReviewModel, ComicReviewActions.COMIC_REVIEW_LOADED);
  return obj;
}

//actions
dynamic GetComicReview(String comicId) {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsComicLoading(true));

    ComicReviewModel model;

    try {
      var comicReview = await FirebaseFirestore.instance
          .collection("comicreview")
          .where("ComicId", isEqualTo: comicId)
          .limit(1)
          .get();

      if (comicReview.docs.isNotEmpty) {
        String ComicId = comicReview.docs.first.get("ComicId");
        String Base64BackImage = comicReview.docs.first.get("Base64BackImage");
        String ComicName = comicReview.docs.first.get("ComicName");
        String ComicResume = comicReview.docs.first.get("ComicResume");
        String ComicOwner = comicReview.docs.first.get("ComicOwner");
        model = ComicReviewModel(
            ComicId, Base64BackImage, ComicName, ComicOwner, ComicResume);
        store.dispatch(ComicReviewLoaded(model));
      } else {
        store.dispatch(ComicReviewLoadingError(true));
      }
    } catch (e) {
      store.dispatch(ComicReviewLoadingError(true));
    }
  };
}
