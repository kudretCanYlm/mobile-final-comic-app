import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_mobile_app/models/Comic/ComicCharacterModel.dart';
import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:redux/redux.dart';

enum ComicCharacterActions {
  COMIC_CHARACTER_LOADING,
  COMIC_CHARACTER_LOADED,
  COMIC_CHARACTER_ERROR
}

//objects
//stay here
class IsComicCharacterLoadingObject {
  ComicCharacterActions type;
  bool isLoading;

  IsComicCharacterLoadingObject(this.isLoading, this.type);
}

class ComicCharacterLoadingErrorObject {
  ComicCharacterActions type;
  bool isError;

  ComicCharacterLoadingErrorObject(this.isError, this.type);
}

class ComicCharacterLoadedObject {
  ComicCharacterActions type;
  List<ComicCharacterModel> comicCharacterList;

  ComicCharacterLoadedObject(this.comicCharacterList, this.type);
}

//types functions
IsComicCharacterLoadingObject IsComicCharacterLoading(bool isLoading) {
  var obj = IsComicCharacterLoadingObject(
      isLoading, ComicCharacterActions.COMIC_CHARACTER_LOADING);
  return obj;
}

ComicCharacterLoadingErrorObject ComicCharacterLoadingError(bool isError) {
  var obj = ComicCharacterLoadingErrorObject(
      isError, ComicCharacterActions.COMIC_CHARACTER_ERROR);

  return obj;
}

ComicCharacterLoadedObject ComicCharacterLoaded(
    List<ComicCharacterModel> comicCharacterList) {
  var obj = ComicCharacterLoadedObject(
      comicCharacterList, ComicCharacterActions.COMIC_CHARACTER_LOADED);
  return obj;
}

dynamic GetComicCharacters(String comicId) {
  return (Store<AppReducerState> store) async {
    store.dispatch(IsComicCharacterLoading(true));

    List<ComicCharacterModel> characterList = [];

    try {
      var comicCharacter = await FirebaseFirestore.instance
          .collection("comiccharacter")
          .where("ComicId", isEqualTo: comicId)
          .get();

      if (comicCharacter.docs.isNotEmpty) {
        comicCharacter.docs.forEach((character) {
          String CharacterId = character.id;
          String CharacterName = character.get("CharacterName");
          String CharacterRole = character.get("CharacterRole");
          String CharacterResume = character.get("CharacterResume");
          String CharacterBase64Image = character.get("CharacterBase64Image");

          var characterModel = ComicCharacterModel(CharacterId, CharacterName,
              CharacterRole, CharacterResume, CharacterBase64Image);
          characterList.add(characterModel);
        });
        store.dispatch(ComicCharacterLoaded(characterList));
      } else {
        store.dispatch(ComicCharacterLoadingError(true));
      }
    } catch (e) {
      store.dispatch(ComicCharacterLoadingError(true));
    }
  };
}
