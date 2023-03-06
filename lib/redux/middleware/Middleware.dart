import 'dart:io';

import 'package:comic_mobile_app/redux/reducers/AppReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/AuthReducer.dart';
import 'package:comic_mobile_app/redux/reducers/Auth/State/AuthReducerState.dart';
import 'package:comic_mobile_app/redux/reducers/User/UserReducer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

// Create Persistor
final persistor = Persistor<AppReducerState>(
  storage:
      FlutterStorage(), //FileStorage(await _localFile), // Or use other engines
  serializer: JsonSerializer<AppReducerState>(
      AppReducerState.fromJson), // Or use other serializers
);
//Set up middlewares
List<Middleware<AppReducerState>> createMiddleware() =>
    <Middleware<AppReducerState>>[
      thunkMiddleware,
      persistor.createMiddleware(),
      //new LoggingMiddleware.printer(),
    ];
