import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/game_details/blocs/game_details_back_button_bloc/game_details_back_button_bloc.dart';

import 'package:game_app/ui/pages/game_details/game_details_layout.dart';

import 'package:game_app/repositories/models/result.dart';

class GameDetailsPage extends StatelessWidget {
  static const String name = "/gameDetailsPage";

  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocProvider<GameDetailsBackButtonBloc>(
          create: (context) => GameDetailsBackButtonBloc(),
          child: GameDetailsLayout(
            data: ModalRoute.of(context)?.settings.arguments as Result?,
          ),
        ),
      ),
    );
  }
}
