import 'package:comic_mobile_app/models/Comic/FavoriteModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'FavoritesReducerState.g.dart';

@JsonSerializable()
class FavoritesReducerState {
  final bool? isLoading;
  final bool? isError;
  final List<FavoriteModel>? favorites;

  final bool? isSending;
  final bool? isSendError;
  final bool? isSended;

  FavoritesReducerState({
    this.isLoading,
    this.isError,
    this.favorites,
    this.isSending,
    this.isSendError,
    this.isSended,
  });

  factory FavoritesReducerState.fromJson(Map<String, dynamic> json) =>
      _$FavoritesReducerStateFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesReducerStateToJson(this);
}
