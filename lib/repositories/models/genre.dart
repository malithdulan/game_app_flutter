import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  const Genre({
    required this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory Genre.fromJson(Map<String, dynamic>? json) {
    return Genre(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      slug: json?['slug'] as String?,
      gamesCount: json?['games_count'] as int?,
      imageBackground: json?['image_background'] as String?,
      domain: json?['domain'] as String?,
      language: json?['language'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, gamesCount, imageBackground, domain, language];
}
