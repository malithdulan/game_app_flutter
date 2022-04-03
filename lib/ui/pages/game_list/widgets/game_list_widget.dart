import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';

import 'package:game_app/ui/pages/game_list/widgets/game_list_success_widget.dart';

import '../blocs/games_bloc/games_bloc.dart';

class GameListWidget extends StatelessWidget {
  const GameListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(
      builder: (context, state) => (state.status.isSuccess)
          ? GameListSuccessWidget(
              games: state.data?.results,
              pageNo: state.pageNo,
              totalGames: state.data?.count,
              isPaginated: state.isPaginating,
            )
          : const SizedBox(),
    );
  }
}
