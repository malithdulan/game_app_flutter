import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/helper/extensions.dart';
import '../../../../../helper/enums.dart';
import '../../../../../helper/error.dart';
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
    on<ShowReloadGamesByCategory>(_mapShowReloadGamesByCategoryToState);
  }

  void _mapGetGamesByCategoryToState(GetGamesByCategory event, Emitter<GamesByCategoryState> emit)  async {

    //check whether loading or not before sending loading state,
    // because ShowReloadCategories trigger loading state with reload button press
    // (avoiding getCategories event trigger loading state again)
    if (!state.status.isLoading) {
      emit(state.copyWith(status: LOADING_STATUS.loading));
    }

    try{
      final games = await repository.getGamesByCategory(event.selectedId);
      emit(state.copyWith(status: LOADING_STATUS.success, data: games, categoryName: event.categoryName));
    } on NoInternetException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error, categoryId: event.selectedId, categoryName: event.categoryName));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error, categoryId: event.selectedId, categoryName: event.categoryName));
    }
  }

  void _mapShowReloadGamesByCategoryToState(ShowReloadGamesByCategory event, Emitter<GamesByCategoryState> emit) {
    emit(state.copyWith(status: LOADING_STATUS.loading));
  }
}