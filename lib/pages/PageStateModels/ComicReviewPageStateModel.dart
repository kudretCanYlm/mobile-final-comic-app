import 'dart:ui';

import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicCharacterReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicReviewReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Comic/State/ComicStatisticsReducerState.dart';
import 'package:comic_mobile_app/widgets/common/ColorsCommon.dart';

class ComicReviewPageStateModel {
  String ComicId = "";
  ComicReviewReducerState? comicReviewReducerState;
  ComicCharacterReducerState? comicCharacterReducerState;
  ComicStatisticsReducerState? comicStatisticsReducerState;
  String dowlandPercentLocal = "";
  ProcessState? state;
  String buttonText = "";
  Color buttonbackgroundColor = COLOR_B_HEAVY;

  ComicReviewPageStateModel();

  processReadyToRead() {
    state = ProcessState.ReadyToRead;
    buttonbackgroundColor = COLOR_B_HEAVY;
    buttonText = "Read Comic Now";
  }

  processReadyToDowland() {
    state = ProcessState.ReadyToDownland;
    buttonText = "Downland Comic Now";
  }

  processDowlandingStart() {
    state = ProcessState.Downlandig;
    buttonbackgroundColor = COLOR_A_LIGHT;
  }

  processDowlanding(String dowlandPercent) {
    dowlandPercentLocal = dowlandPercent;
    buttonText = "Downlanding %$dowlandPercentLocal";
  }

  processSaving() {
    state = ProcessState.Saving;
    buttonText = "Saving the file..";
  }

  setComicId(String comicId) {
    ComicId = comicId;
  }
}

enum ProcessState {
  ReadyToRead,
  ReadyToDownland,
  Downlandig,
  Saving,
}
