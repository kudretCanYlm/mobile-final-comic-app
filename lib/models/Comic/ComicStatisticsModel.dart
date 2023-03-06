import 'package:json_annotation/json_annotation.dart';
part 'ComicStatisticsModel.g.dart';

@JsonSerializable()
class ComicStatisticsModel {
  final String Rating;
  final String Chapter;
  final String Language;

  ComicStatisticsModel(this.Rating, this.Chapter, this.Language);

  factory ComicStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$ComicStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicStatisticsModelToJson(this);
}
