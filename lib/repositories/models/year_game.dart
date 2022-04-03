import 'package:equatable/equatable.dart';

class YearGame extends Equatable {
  final int? year;
  final int? count;
  final bool? nofollow;

  const YearGame({
    this.year,
    this.count,
    this.nofollow,
  });

  @override
  List<Object?> get props => [year, count, nofollow];
}