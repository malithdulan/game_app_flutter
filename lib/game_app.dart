import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/repositories/game_repository.dart';
import 'package:game_app/ui/global_blocs/theme_bloc/theme_bloc.dart';

import 'package:logging/logging.dart';

import 'helper/game_themes.dart';

class GameApp extends StatefulWidget {
  const GameApp({Key? key}) : super(key: key);

  @override
  _GameAppState createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> with WidgetsBindingObserver {
  late StreamSubscription<LogRecord> logSubscription;
  late bool themeStatus; //theme initial state (dark or light)
  @override
  void initState() {
    _loggerSubscription();
    WidgetsBinding.instance?.addObserver(this);
    themeStatus = Utils.shared.isDark;
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _dynamicThemeChange(state);
    super.didChangeAppLifecycleState(state);
  }

  void _dynamicThemeChange(AppLifecycleState state) {
    //check theme has changed or not when come to foreground (by user from settings)
    if (state == AppLifecycleState.resumed &&
        themeStatus != Utils.shared.isDark) {
      themeStatus = Utils.shared.isDark;
      context
          .read<ThemeBloc>()
          .add(ChangeTheme(value: Utils.shared.isDark ? true : false));
    }
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
    return MultiRepositoryProvider(
      //provide a single repository instance
      providers: [
        RepositoryProvider(create: (context) => GameRepository()),
        RepositoryProvider(create: (context) => AuthRepository()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'Game App',
          themeMode: state.themeMode,
          theme: GameThemes.lightTheme,
          darkTheme: GameThemes.darkTheme,
          onGenerateRoute: (routeSettings) =>
              Utils.shared.onGenerateRoute(routeSettings),
        ),
      ),
    );
  }

  @override
  void dispose() {
    logSubscription.cancel(); //cancel log subscription
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
