import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/enums.dart';
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
  }

  void _mapGetCategoriesEventToState(
      GetCategories event, Emitter<CategoryState> emit) async {

    emit(CategoryDataState(status: LOADING_STATUS.loading));
    try {
      final genres = await repository.getGenres();
      emit(CategoryDataState(status: LOADING_STATUS.success, data: genres));
    } catch (error, stacktrace) {
      emit(CategoryDataState(status: LOADING_STATUS.error));
    }
  }

  void _mapSelectCategoryEventToState(
      SelectCategory event, Emitter<CategoryState> emit) async {
    emit(CategorySelectState(selectedId: event.selectedId));
  }

}