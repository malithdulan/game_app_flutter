import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/pages/game_list/blocs/games_bloc/games_bloc.dart';

class GameListPaginateIndicator extends StatelessWidget {
  const GameListPaginateIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: BlocBuilder<GamesBloc, GamesState>(
          //build if paginate state changes (current not equal to previous true/false).
          //or previous had paginate true and error (this is for show paginate loading again if there was an error).
          //or current paginate is true and there is an error.
          buildWhen: (previous, current) =>
              (current.isPaginating != previous.isPaginating) ||
              (previous.isPaginating && previous.status.isError) ||
              (current.isPaginating && current.status.isError),
          builder: (context, state) => (state.status.isError) //error or loading
              ? Text(
                  state.errorMessage ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.shared.fScale(12),
                  ),
                )
              : Opacity(
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
