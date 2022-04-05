import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/helper/error.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/repositories/game_repository.dart';

import '../../../../../repositories/models/genre.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GameRepository repository;

  CategoryBloc({
    required this.repository,
  }) : super(CategoryDataState()) {
    on<GetCategories>(_mapGetCategoriesEventToState);
    on<SelectCategory>(_mapSelectCategoryEventToState);
    on<ShowReloadCategory>(_mapShowReloadCategoryEventToState);
  }

  void _mapGetCategoriesEventToState(
      GetCategories event, Emitter<CategoryState> emit) async {
    if (state is CategoryDataState) {

      //check whether loading or not before sending loading state,
      // because ShowReloadCategories trigger loading state with reload button press
      // (avoiding getCategories event trigger loading state again)
      if (!(state as CategoryDataState).status.isLoading) {
        emit((state as CategoryDataState).copyWith(status: LOADING_STATUS.loading));
      }

      try {
        final genres = await repository.getGenres();
        emit((state as CategoryDataState).copyWith(status: LOADING_STATUS.success, data: genres));
      } on NoInternetException catch (e) {
        emit((state as CategoryDataState).copyWith(status: LOADING_STATUS.error, errorMessage: e.error));
      } on NetworkException catch (e) {
        emit((state as CategoryDataState).copyWith(status: LOADING_STATUS.error, errorMessage: e.error));
      }
    }
  }

  void _mapSelectCategoryEventToState(
      SelectCategory event, Emitter<CategoryState> emit) async {
    emit(CategorySelectState(selectedId: event.selectedId));
  }

  void _mapShowReloadCategoryEventToState(ShowReloadCategory event, Emitter<CategoryState> emit) {
    if (state is CategoryDataState) {
      emit((state as CategoryDataState).copyWith(status: LOADING_STATUS.loading));
    }
  }

}