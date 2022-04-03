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

  factory Platform.fromJson(Map<String, dynamic>? json) {
    return Platform(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      slug: json?['slug'] as String?,
      image: json?['image'] as String?,
      yearEnd: json?['year_end'] as String?,
      yearStart: json?['year_start'] as int?,
      gamesCount: json?['games_count'] as int?,
      imageBackground: json?['image_background'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name , slug, image, yearEnd, yearStart, gamesCount, imageBackground];
}