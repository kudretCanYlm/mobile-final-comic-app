import 'package:comic_mobile_app/models/Search/common/SearchResultTypes.dart';

class SearchResultModel {
  final SearchResultTypes ResultType;
  final String Id;
  final String Base64Image;
  final String Name;

  SearchResultModel(this.ResultType, this.Id, this.Base64Image, this.Name);
}
