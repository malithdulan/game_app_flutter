import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/game_list/blocs/games_bloc/games_bloc.dart';

class GameListProgressIndicator extends StatelessWidget {
  const GameListProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: BlocBuilder<GamesBloc, GamesState>(
          buildWhen: (previous, current) => current.isPaginating != previous.isPaginating,
          builder: (context, state) => Opacity(
            opacity: state.isPaginating ? 1.0 : 0.0,
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
