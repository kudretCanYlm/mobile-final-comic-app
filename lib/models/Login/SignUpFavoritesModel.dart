class SignUpFavoritesModel {
  List<String> FavoritesId = [];

  SignUpFavoritesModel();

  addFavorite(String Id) {
    FavoritesId.add(Id);
  }

  removeFavorite(String Id) {
    FavoritesId.remove(Id);
  }
}
