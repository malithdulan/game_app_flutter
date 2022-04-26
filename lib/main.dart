import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/app_data.dart';
import 'package:game_app/ui/global_blocs/theme_bloc/theme_bloc.dart';

import 'game_app.dart';
import 'helper/app_bloc_observer.dart';
import 'package:game_app/helper/log.dart';

import 'helper/constants.dart';
import 'helper/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Log.shared.configLogger(); //disable logger if production

  //chek the validation of jwt token
  bool valid = await Utils.shared.checkJWT;
  AppData.shared.setUserStatus(valid);

  BlocOverrides.runZoned(
    //current state and next event will be printed
    () => runApp(
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc()
          ..add(
            ChangeTheme(value: Utils.shared.isDark ? true : false),
          ),
        child: const GameApp(),
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}
