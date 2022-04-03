import 'package:equatable/equatable.dart';

class Platform extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  const Platform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  @override
  List<Object?> get props => [id, name , slug, image, yearEnd, yearStart, gamesCount, imageBackground];
}