import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/Helper/string/StringCasingExtension.dart';
import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:comic_mobile_app/models/User/UserFavoriteModel.dart';
import 'package:comic_mobile_app/pages/MainPage/MainPage.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/routes/Route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum FavoriteActions {
  FAVORITE_LOADING,
  FAVORITE_ERROR,
  FAVORITE_LOADED,
  FAVORITE_SENDING,
  FAVORITE_SENDING_ERROR,
  FAVORITE_SENDED
}

//object
//get
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

//push
class IsFavoriteSendingObject {
  FavoriteActions type;
  bool isSending;

  IsFavoriteSendingObject(this.isSending, this.type);
}

class FavoriteSendingErrorObject {
  FavoriteActions type;
  bool isSendError;

  FavoriteSendingErrorObject(this.isSendError, this.type);
}

class FavoriteSendedObject {
  FavoriteActions type;
  bool isSended;

  FavoriteSendedObject(this.isSended, this.type);
}

//types functions
//get
IsFavoriteLoadingObject IsFavoriteLoading(bool isLoading) {
  var obj =
      IsFavoriteLoadingObject(isLoading, FavoriteActions.FAVORITE_LOADING);

  return obj;
}

FavoriteLoadingErrorObject FavoriteLoadingError(bool isSendError) {
  var obj =
      FavoriteLoadingErrorObject(isSendError, FavoriteActions.FAVORITE_ERROR);

  return obj;
}

FavoriteLoadedObject FavoriteLoaded(List<FavoriteModel> favorites) {
  var obj = FavoriteLoadedObject(favorites, FavoriteActions.FAVORITE_LOADED);

  return obj;
}

//post
IsFavoriteSendingObject IsFavoriteSending(bool isSending) {
  var obj =
      IsFavoriteSendingObject(isSending, FavoriteActions.FAVORITE_SENDING);
  return obj;
}

FavoriteSendingErrorObject FavoriteSendingError(bool isError) {
  var obj = FavoriteSendingErrorObject(
      isError, FavoriteActions.FAVORITE_SENDING_ERROR);
  return obj;
}

FavoriteSendedObject FavoriteSended(bool isSended) {
  var obj = FavoriteSendedObject(isSended, FavoriteActions.FAVORITE_SENDED);
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

dynamic SendFavoriteList(BuildContext context, Store<AppReducerState> store,
    List<UserFavoriteModel> favorites) {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsFavoriteSending(true));
    CollectionReference favorite =
        FirebaseFirestore.instance.collection('userfavorite');

    favorites.forEach((fav) {
      favorite.add({
        'FavoriteId': fav.FavoriteId,
        'UserId': store.state.registerReducerState!.userId,
      }).then((value) {
        store.dispatch(FavoriteSended(true));
        Navigator.of(context).popUntil((route) => route.settings.name == '/');
        Navigator.of(context).push(mainPageRoute());
      }).catchError((error) {
        store.dispatch(FavoriteSendingError(true));
      });
    });
  };
}
