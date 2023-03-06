import 'package:json_annotation/json_annotation.dart';
part 'FavoriteModel.g.dart';

@JsonSerializable()
class FavoriteModel {
  String Id;
  String Name;
  int Icon;

  FavoriteModel(this.Id, this.Name, this.Icon);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}
