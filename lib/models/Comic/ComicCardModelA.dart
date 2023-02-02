import 'package:json_annotation/json_annotation.dart';

part 'ComicCardModelA.g.dart';

@JsonSerializable()
class ComicCardModelA {
  final String ComicId;
  final String ComicName;
  final String ImageBase64;
  final String ComicOwner;

  ComicCardModelA(
      this.ComicId, this.ComicName, this.ImageBase64, this.ComicOwner);

  factory ComicCardModelA.fromJson(Map<String, dynamic> json) =>
      _$ComicCardModelAFromJson(json);

  Map<String, dynamic> toJson() => _$ComicCardModelAToJson(this);
}
