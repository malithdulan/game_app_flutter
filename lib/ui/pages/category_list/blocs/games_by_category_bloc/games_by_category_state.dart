part of 'games_by_category_bloc.dart';

class GamesByCategoryState extends Equatable {
  final LOADING_STATUS status;
  final List<Result>? data;
  final String? categoryName;

  const GamesByCategoryState({
    this.status = LOADING_STATUS.initial,
    this.data,
    this.categoryName,
  });

  @override
  List<Object?> get props => [status, data, categoryName];
}