import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/Helper/string/StringCasingExtension.dart';
import 'package:comic_mobile_app/models/Search/SearchResultModel.dart';
import 'package:comic_mobile_app/models/Search/common/SearchResultTypes.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum SearchActions {
  READY_SEARCH,
  SEARCHING,
  SEARCH_ERROR,
  SEARCHED,
  SEARCHED_NOT_FOUND,
}

//objects
class ReadySearchObject {
  SearchActions type;

  ReadySearchObject(this.type);
}

class IsSearchingObject {
  SearchActions type;
  bool isSearcing;

  IsSearchingObject(this.isSearcing, this.type);
}

class SearchErrorObject {
  SearchActions type;
  bool isError;

  SearchErrorObject(this.isError, this.type);
}

class SearchedObject {
  SearchActions type;
  List<SearchResultModel> searches;

  SearchedObject(this.searches, this.type);
}

class SearchedNotFoundObject {
  SearchActions type;
  bool notfound;

  SearchedNotFoundObject(this.notfound, this.type);
}

//types functions
ReadySearchObject ReadySearch() {
  var obj = ReadySearchObject(SearchActions.READY_SEARCH);

  return obj;
}

IsSearchingObject IsSearching(bool isSearcing) {
  var obj = IsSearchingObject(isSearcing, SearchActions.SEARCHING);

  return obj;
}

SearchErrorObject SearchError(bool isError) {
  var obj = SearchErrorObject(isError, SearchActions.SEARCH_ERROR);

  return obj;
}

SearchedObject Searched(List<SearchResultModel> searches) {
  var obj = SearchedObject(searches, SearchActions.SEARCHED);

  return obj;
}

SearchedNotFoundObject SearchedNotFound(bool notfound) {
  var obj = SearchedNotFoundObject(notfound, SearchActions.SEARCHED_NOT_FOUND);

  return obj;
}

//actions
dynamic Search(String text) {
  return (Store<AppReducerState> store) async {
    List<SearchResultModel> searchResult = [];
    text = text.toLowerCase();

    store.dispatch(IsSearching(true));

    try {
      var comics = await FirebaseFirestore.instance
          .collection("comic")
          .orderBy("Name")
          .where('Name', isGreaterThanOrEqualTo: text)
          .where('Name', isLessThanOrEqualTo: '$text~')
          .get();

      var users = await FirebaseFirestore.instance
          .collection("user")
          .orderBy("NickName")
          .where('NickName', isGreaterThanOrEqualTo: text)
          .where('NickName', isLessThanOrEqualTo: '$text~')
          .get();
      if (comics.docs.isNotEmpty || users.docs.isNotEmpty) {
        //set comics
        comics.docs.forEach((comicJson) {
          String id = comicJson.id;
          String name = comicJson.get("Name");
          String base64 = comicJson.get("Base64Image");

          var comic =
              SearchResultModel(SearchResultTypes.Comic, id, base64, name);
          searchResult.add(comic);
        });
        //set users
        users.docs.forEach((userJson) {
          String id = userJson.id;
          String name = userJson.get("NickName");
          String base64 = userJson.get("base64Image");

          var user =
              SearchResultModel(SearchResultTypes.User, id, base64, name);
          searchResult.add(user);
        });

        store.dispatch(Searched(searchResult));
      } else {
        store.dispatch(SearchedNotFound(true));
      }
    } catch (e) {
      InitSearch();
      store.dispatch(SearchError(true));
    }
  };
}

dynamic InitSearch() {
  return (Store<AppReducerState> store) async {
    store.dispatch(ReadySearch());
  };
}
