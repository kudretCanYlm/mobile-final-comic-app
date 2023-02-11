import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/Helper/string/StringCasingExtension.dart';
import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum FavoriteActions {
  FAVORITE_LOADING,
  FAVORITE_ERROR,
  FAVORITE_LOADED,
}

//object
class IsFavoriteLoadingObject {
  FavoriteActions type;
  bool isLoading;

  IsFavoriteLoadingObject(this.isLoading, this.type);
}

class FavoriteLoadingErrorObject {
  FavoriteActions type;
  bool isError;

  FavoriteLoadingErrorObject(this.isError, this.type);
}

class FavoriteLoadedObject {
  FavoriteActions type;
  List<FavoriteModel> favorites;

  FavoriteLoadedObject(this.favorites, this.type);
}

//types functions
IsFavoriteLoadingObject IsFavoriteLoading(bool isLoading) {
  var obj =
      IsFavoriteLoadingObject(isLoading, FavoriteActions.FAVORITE_LOADING);

  return obj;
}

FavoriteLoadingErrorObject FavoriteLoadingError(bool isError) {
  var obj = FavoriteLoadingErrorObject(isError, FavoriteActions.FAVORITE_ERROR);

  return obj;
}

FavoriteLoadedObject FavoriteLoaded(List<FavoriteModel> favorites) {
  var obj = FavoriteLoadedObject(favorites, FavoriteActions.FAVORITE_LOADED);

  return obj;
}

//actions
dynamic GetFavoriteList() {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsFavoriteLoading(true));
    try {
      var favorites =
          await FirebaseFirestore.instance.collection("favorite").get();

      if (favorites.docs.isNotEmpty) {
        List<FavoriteModel> favoriteList = [];
        favorites.docs.forEach((favoriteJson) {
          String favoriteId = favoriteJson.id;
          String favoriteName =
              favoriteJson.get("Name").toString().toTitleCase();
          int favoriteIcon = favoriteJson.get("Icon");

          var comic = FavoriteModel(favoriteId, favoriteName, favoriteIcon);
          favoriteList.add(comic);
        });

        store.dispatch(FavoriteLoaded(favoriteList));
      } else {
        store.dispatch(FavoriteLoadingError(true));
      }
    } catch (e) {
      store.dispatch(FavoriteLoadingError(true));
    }
  };
}
