import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/repositories/game_repository.dart';

import '../../../../../helper/error.dart';
import '../../../../../repositories/models/game.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository repository;
  Game? _gameList;
  GamesBloc({required this.repository}) : super(const GamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
    on<ShowReloadGames>(_mapShowReloadGamesToState);
  }

  void _mapGetGamesEventToState(
      GetGames event, Emitter<GamesState> emit) async {

    if (!event.isPaginating) {//not pagination loading
      if (!state.status.isLoading) {//avoid trigger loading again if previous state is loading (triggered by reload button)
        //initial get data loading
        emit(state.copyWith(status: LOADING_STATUS.loading, isPaginating: false));
      }
    } else {//pagination loading
      emit(state.copyWith(isPaginating: event.isPaginating));
    }

    try {
      final games = await repository.getGames(event.pageNo);

      if (state.data != null) {
        _gameList?.results
            .addAll(games.results); //add newly fetched data to the list
      } else {
        _gameList = games;
      }

      emit(state.copyWith(
          status: LOADING_STATUS.success,
          data: _gameList,
          pageNo: event.pageNo,
          isPaginating: false));
    } on NoInternetException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error, isPaginating: false));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error, isPaginating: false));
    }
  }

  void _mapShowReloadGamesToState(ShowReloadGames event, Emitter<GamesState> emit) {
    emit(state.copyWith(status: LOADING_STATUS.loading, isPaginating: false));
  }
}
