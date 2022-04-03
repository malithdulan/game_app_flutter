part of 'category_bloc.dart';

class CategoryEvent extends Equatable  {
  @override
  List<Object?> get props => [];
}

class GetCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  final int? selectedId;
  SelectCategory({required this.selectedId});

  @override
  List<Object?> get props => [selectedId];
}