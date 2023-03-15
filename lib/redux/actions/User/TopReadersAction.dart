import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/User/UserModelA.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum TopReadersActions {
  TOP_READERS_LOADING,
  TOP_READERS_ERROR,
  TOP_READERS,
}

//objects
class IsTopReadersLoadingObject {
  TopReadersActions type;
  bool isLoading;

  IsTopReadersLoadingObject(this.isLoading, this.type);
}

class TopReadersLoadingErrorObject {
  TopReadersActions type;
  bool isError;

  TopReadersLoadingErrorObject(this.isError, this.type);
}

class TopReadersLoadedObject {
  TopReadersActions type;
  List<UserModelA> topReaderList;

  TopReadersLoadedObject(this.topReaderList, this.type);
}

//types functions
IsTopReadersLoadingObject IsTopReadersLoading(bool isLoading) {
  var obj = IsTopReadersLoadingObject(
      isLoading, TopReadersActions.TOP_READERS_LOADING);
  return obj;
}

TopReadersLoadingErrorObject TopReadersLoadingError(bool isError) {
  var obj = TopReadersLoadingErrorObject(
      isError, TopReadersActions.TOP_READERS_ERROR);
  return obj;
}

TopReadersLoadedObject TopReadersLoaded(List<UserModelA> topReaderList) {
  var obj =
      TopReadersLoadedObject(topReaderList, TopReadersActions.TOP_READERS);
  return obj;
}

//actions
//Get
dynamic GetTopReaders() {
  return (Store<AppReducerState> store) async {
    List<UserModelA> topReadersResult = [];

    store.dispatch(IsTopReadersLoading(true));

    try {
      var topReaders = await FirebaseFirestore.instance
          .collection("user")
          .orderBy("NickName")
          //.where("id", isNotEqualTo: store.state.authReducerState!.userId)
          .limit(10)
          .get();
      topReaders.docs.forEach((topReader) {
        topReadersResult.add(UserModelA(topReader.id,
            topReader.get("base64Image"), topReader.get("RealName")));
      });

      store.dispatch(TopReadersLoaded(topReadersResult));
    } catch (e) {
      store.dispatch(TopReadersLoadingError(true));
    }
  };
}
