import 'package:equatable/equatable.dart';
import 'filters_year.dart';

class Filters extends Equatable {
  final List<FiltersYear>? years;

  const Filters({
    this.years,
  });

  @override
  List<Object?> get props => [years];
}