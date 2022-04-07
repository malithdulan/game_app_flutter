import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/utils.dart';

import '../../../../../helper/enums.dart';
import '../../../../global_widgets/error_placeholder.dart';
import '../../../../global_widgets/loading_placeholder.dart';
import '../../blocs/games_bloc/games_bloc.dart';
import 'game_list_success.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  void _getGames(BuildContext context) {
    context
        .read<GamesBloc>()
        .add(ShowReloadGames()); //show reloading after reload button press
    //a delay to show it's working, avoiding the user confusion of pressing the reload button
    Utils.shared.executeWithDelay(
      callBack: () => context
          .read<GamesBloc>()
          .add(GetGames(pageNo: 1, isPaginating: false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GamesBloc, GamesState>(
        //only build when pagination is false, don't want to build when true
        //only pagination loader builder will get rebuild when isPaginated true, not this builder
        //on success, loading, error (bloc sends isPaginating value false), so no worries
        buildWhen: (previous, current) => !current.isPaginating,
        builder: (context, state) {
          switch (state.status) {
            case LOADING_STATUS.success:
              return GameListSuccess(
                games: state.data?.results,
                pageNo: state.pageNo,
                totalGames: state.data?.count,
                isPaginated: state.isPaginating,
              );
            case LOADING_STATUS.error:
              return ErrorPlaceholder(
                showImage: true,
                message: state.errorMessage,
                callBack: () => _getGames(context),
              );
            case (LOADING_STATUS.loading):
              return const LoadingPlaceholder();
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
