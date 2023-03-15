import 'package:json_annotation/json_annotation.dart';

part 'ComicDataModel.g.dart';

@JsonSerializable()
class ComicDataModel {
  final String ComicId;

  final int TotalData;
  String _processPercent = "";
  int _received = 0;
  bool IsDownload = false;
  bool? IsSaving;
  bool? IsSaved;

  ComicDataModel(this.ComicId, this.TotalData);

  String calculatePercent(int received) {
    _processPercent =
        ((100 * received) / TotalData).toString().split(".").first;
    if (_processPercent == "100") {
      IsDownload = true;
    }
    print(_processPercent);
    return _processPercent;
  }

  comicSaving() {
    this.IsSaving = true;
    this.IsSaved = false;
  }

  comicSaved() {
    this.IsSaving = false;
    this.IsSaved = true;
  }

  String getPercent() => _processPercent;

  bool isComicDowlanded() => IsDownload;

  factory ComicDataModel.fromJson(Map<String, dynamic> json) =>
      _$ComicDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicDataModelToJson(this);
}
