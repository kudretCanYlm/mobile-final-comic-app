import 'package:json_annotation/json_annotation.dart';

part 'ComicDataModel.g.dart';

@JsonSerializable()
class ComicDataModel {
  final String ComicId;

  final int TotalData;
  String _processPercent = "";
  int _received = 0;
  bool _isDownload = false;
  bool? isSaving;
  bool? isSaved;

  ComicDataModel(this.ComicId, this.TotalData);

  String calculatePercent(int received) {
    _processPercent =
        ((100 * received) / TotalData).toString().split(".").first;
    if (_processPercent == "100") {
      _isDownload = true;
    }
    print(_processPercent);
    return _processPercent;
  }

  comicSaving() {
    this.isSaving = true;
    this.isSaved = false;
  }

  comicSaved() {
    this.isSaving = false;
    this.isSaved = true;
  }

  String getPercent() => _processPercent;

  bool isComicDowlanded() => _isDownload;

  factory ComicDataModel.fromJson(Map<String, dynamic> json) =>
      _$ComicDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicDataModelToJson(this);
}
