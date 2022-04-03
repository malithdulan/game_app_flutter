import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/games_bloc/games_bloc.dart';
import 'package:game_app/helper/extensions.dart';

import 'package:game_app/ui/pages/game_list/widgets/game_list_success.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(
      builder: (context, state) => (state.status.isSuccess)
          ? GameListSuccess(
              games: state.data?.results,
              pageNo: state.pageNo,
              totalGames: state.data?.count,
              isPaginated: state.isPaginating,
            )
          : const SizedBox(),
    );
  }
}
