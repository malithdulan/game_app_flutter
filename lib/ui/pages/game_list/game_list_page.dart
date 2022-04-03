import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/repositories/game_repository.dart';

import 'package:game_app/ui/pages/game_list/game_list_layout.dart';

import 'blocs/games_bloc/games_bloc.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocProvider<GamesBloc>(
          create: (context) => GamesBloc(
            repository: context.read<GameRepository>(),
          )..add(GetGames(pageNo: 1)),
          child: const GameListLayout(),
        ),
      ),
    );
  }
}
