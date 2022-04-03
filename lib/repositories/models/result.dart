import 'package:equatable/equatable.dart';

import 'package:game_app/repositories/models/parent_platform.dart';
import 'package:game_app/repositories/models/platform_element.dart';
import 'package:game_app/repositories/models/rating.dart';
import 'package:game_app/repositories/models/short_screenshot.dart';
import 'package:game_app/repositories/models/store.dart';

import 'added_by_status.dart';
import 'esrb_rating.dart';
import 'genre.dart';

class Result extends Equatable {
  final int? id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  const Result({
    required this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  factory Result.fromJson(Map<String, dynamic>? json) {
    return Result(
      id: json?['id'] as int?,
      slug: json?['slug'] as String?,
      name: json?['name'] as String?,
      released: DateTime.tryParse((json?['released'] as String?) ?? ""),
      tba: json?['tba'] as bool?,
      backgroundImage: json?['background_image'] as String?,
      rating: (json?['rating'] as num?)?.toDouble(),
      ratingTop: json?['rating_top'] as int?,
      ratingsCount: json?['ratings_count'] as int?,
      reviewsTextCount: json?['reviews_text_count'] as int?,
      added: json?['added'] as int?,
      metacritic: json?['metacritic'] as int?,
      playtime: json?['playtime'] as int?,
      suggestionsCount: json?['suggestions_count'] as int?,
      updated: DateTime.tryParse((json?['updated'] as String?) ?? ""),
      userGame: json?['user_game'] as String?,
      reviewsCount: json?['reviews_count'] as int?,
      saturatedColor: json?['saturated_color'] as String?,
      dominantColor: json?['dominant_color'] as String?,
      genres: (json?['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      clip: json?['clip'] as String?,
      tags: (json?['tags'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>?))
          .toList(),
      shortScreenshots: (json?['short_screenshots'] as List<dynamic>?)
          ?.map((e) => ShortScreenshot.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        released,
        tba,
        backgroundImage,
        rating,
        ratingTop,
        ratings,
        ratingsCount,
        reviewsTextCount,
        added,
        addedByStatus,
        metacritic,
        playtime,
        suggestionsCount,
        updated,
        userGame,
        reviewsCount,
        saturatedColor,
        dominantColor,
        platforms,
        parentPlatforms,
        genres,
        stores,
        clip,
        tags,
        esrbRating,
        shortScreenshots,
      ];
}
