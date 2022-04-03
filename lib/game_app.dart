import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/game_repository.dart';

import 'package:logging/logging.dart';

class GameApp extends StatefulWidget {
  const GameApp({Key? key}) : super(key: key);

  @override
  _GameAppState createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late StreamSubscription<LogRecord> logSubscription;

  @override
  void initState() {
    _loggerSubscription();
    super.initState();
  }

  void _loggerSubscription() {
    logSubscription = Logger.root.onRecord.listen(
      (record) {
        if (kDebugMode) {
          print('${record.level.name}: ${record.time}: ${record.message}');
        }
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      //provide a single repository instance
      create: (context) => GameRepository(),
      child: MaterialApp(
        title: 'Game App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (routeSettings) =>
            Utils.shared.onGenerateRoute(routeSettings),
      ),
    );
  }

  @override
  void dispose() {
    logSubscription.cancel(); //cancel log subscription
    super.dispose();
  }
}
