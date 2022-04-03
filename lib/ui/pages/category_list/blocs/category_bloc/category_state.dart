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

  CategoryDataState({
    this.status = LOADING_STATUS.initial,
    this.data,
  });

  @override
  List<Object?> get props => [status, data];
}


