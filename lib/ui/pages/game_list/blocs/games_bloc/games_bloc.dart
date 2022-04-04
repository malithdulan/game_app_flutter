import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/repositories/game_repository.dart';

import '../../../../../repositories/models/game.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository repository;
  Game? _gameList;
  GamesBloc({required this.repository}) : super(const GamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
  }

  void _mapGetGamesEventToState(
      GetGames event, Emitter<GamesState> emit) async {
    (!event.isPaginating)
        ? emit(state.copyWith(status: LOADING_STATUS.loading))//initial get data loading
        : emit(state.copyWith(isPaginating: event.isPaginating));//pagination loading
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
    } catch (error, stackTrace) {
      emit(state.copyWith(status: LOADING_STATUS.error));
    }
  }
}
