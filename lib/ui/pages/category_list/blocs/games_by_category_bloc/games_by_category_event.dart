part of 'games_by_category_bloc.dart';

class GamesByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGamesByCategory extends GamesByCategoryEvent {
  final int? selectedId;
  final String? categoryName;
  GetGamesByCategory({required this.selectedId, required this.categoryName});

  @override
  List<Object?> get props => [selectedId, categoryName];
}

class ShowReloadGamesByCategory extends GamesByCategoryEvent {}