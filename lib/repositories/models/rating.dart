import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  const Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  @override
  List<Object?> get props => [id, title, count, percent];
}