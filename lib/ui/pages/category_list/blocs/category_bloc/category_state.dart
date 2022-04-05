part of 'category_bloc.dart';

class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategorySelectState extends CategoryState {
  final int? selectedId;
  CategorySelectState({this.selectedId});

  @override
  List<Object?> get props => [selectedId];
}

class CategoryDataState extends CategoryState {
  final List<Genre>? data;
  final LOADING_STATUS status;
  final String? errorMessage;

  CategoryDataState({
    this.status = LOADING_STATUS.initial,
    this.data,
    this.errorMessage,
  });

  CategoryDataState copyWith({List<Genre>? data, LOADING_STATUS? status, String? errorMessage}) {
    return CategoryDataState(
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}


