import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helper/utils.dart';
import '../blocs/games_bloc/games_bloc.dart';
import '../game_search_delegate.dart';

class GameListSearchButton extends StatelessWidget {
  const GameListSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(
      buildWhen: (previous, current) => current.data != previous.data,
      builder: (context, state) => IconButton(
        icon: Icon(Icons.search_outlined, size: Utils.shared.percentW(8), color: Colors.white,),
        onPressed: () {
          showSearch(
              context: context, delegate: GameSearchDelegate(data: state.data?.results));
        },
      ),
    );
  }
}
