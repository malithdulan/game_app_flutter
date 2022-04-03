import 'package:equatable/equatable.dart';
import 'package:game_app/repositories/models/year_game.dart';

class FiltersYear extends Equatable {
  final int? from;
  final int? to;
  final String? filter;
  final int? decade;
  final List<YearGame>? years;
  final bool? nofollow;
  final int? count;

  const FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  @override
  List<Object?> get props => [from, to, filter, decade, years, nofollow, count];
}