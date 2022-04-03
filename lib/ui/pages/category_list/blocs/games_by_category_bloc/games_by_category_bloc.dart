import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../helper/enums.dart';
import '../../../../../repositories/game_repository.dart';
import '../../../../../repositories/models/result.dart';

part 'games_by_category_event.dart';
part 'games_by_category_state.dart';

class GamesByCategoryBloc extends Bloc<GamesByCategoryEvent, GamesByCategoryState> {
  final GameRepository repository;

  GamesByCategoryBloc({
    required this.repository,
  }) : super(const GamesByCategoryState()) {
    on<GetGamesByCategory>(_mapGetGamesByCategoryToState);
  }

  void _mapGetGamesByCategoryToState(GetGamesByCategory event, Emitter<GamesByCategoryState> emit)  async {
    emit(const GamesByCategoryState(status: LOADING_STATUS.loading));
    try{
      final games = await repository.getGamesByCategory(event.selectedId);
      emit(GamesByCategoryState(status: LOADING_STATUS.success, data: games, categoryName: event.categoryName));
    } catch (error, stackTrace) {
      emit(const GamesByCategoryState(status: LOADING_STATUS.error));
    }
  }
}