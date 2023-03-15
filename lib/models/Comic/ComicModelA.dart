import 'package:json_annotation/json_annotation.dart';
part 'ComicModelA.g.dart';

@JsonSerializable()
class ComicModelA {
  final String Id;
  final String Name;
  final String Base64Image;

  ComicModelA(
    this.Id,
    this.Name,
    this.Base64Image,
  );

  factory ComicModelA.fromJson(Map<String, dynamic> json) =>
      _$ComicModelAFromJson(json);

  Map<String, dynamic> toJson() => _$ComicModelAToJson(this);
}
