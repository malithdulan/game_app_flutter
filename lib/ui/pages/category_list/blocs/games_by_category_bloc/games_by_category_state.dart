part of 'games_by_category_bloc.dart';

class GamesByCategoryState extends Equatable {
  final LOADING_STATUS status;
  final List<Result>? data;
  final int? categoryId;
  final String? categoryName;
  final String? errorMessage;

  const GamesByCategoryState({
    this.status = LOADING_STATUS.initial,
    this.data,
    this.categoryId,
    this.categoryName,
    this.errorMessage,
  });

  GamesByCategoryState copyWith({
    List<Result>? data,
    LOADING_STATUS? status,
    int? categoryId,
    String? categoryName,
    String? errorMessage,
  }) {
    return GamesByCategoryState(
      data: data ?? this.data,
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, data, categoryId, categoryName, errorMessage];
}
