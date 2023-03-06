import 'package:json_annotation/json_annotation.dart';

part 'ComicReviewModel.g.dart';

@JsonSerializable()
class ComicReviewModel {
  final String ComicId;
  final String Base64BackImage;
  final String ComicName;
  final String ComicResume;
  final String ComicOwner;

  ComicReviewModel(this.ComicId, this.Base64BackImage, this.ComicName,
      this.ComicOwner, this.ComicResume);

  factory ComicReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ComicReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicReviewModelToJson(this);
}
