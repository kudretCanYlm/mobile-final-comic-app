import 'package:json_annotation/json_annotation.dart';
part 'ComicCardLikedModel.g.dart';

@JsonSerializable()
class ComicCardLikedModel {
  final String ComicId;
  final String ComicName;
  final String ComicOwner;
  final String ImageBase64;
  final String ChapterName;
  final String Mark;

  ComicCardLikedModel(this.ComicId, this.ComicName, this.ComicOwner,
      this.ImageBase64, this.ChapterName, this.Mark);
  factory ComicCardLikedModel.fromJson(Map<String, dynamic> json) =>
      _$ComicCardLikedModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicCardLikedModelToJson(this);
}
