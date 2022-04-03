import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_app.dart';
import 'helper/app_bloc_observer.dart';
import 'package:game_app/helper/log.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Log.shared.configLogger(); //disable logger if production

  BlocOverrides.runZoned(//current state and next event will be printed
        () => runApp(const GameApp()),
    blocObserver: AppBlocObserver(),
  );

}




