import 'package:equatable/equatable.dart';
import 'package:game_app/repositories/models/result.dart';

import 'filters.dart';

class Game extends Equatable {
  final int? count;
  final String? next;
  final int? previous;
  final List<Result> results;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final String? seoH1;
  final bool? noindex;
  final bool? nofollow;
  final String? description;
  final Filters? filters;
  final List<String>? nofollowCollections;

  const Game({
    this.count,
    this.next,
    this.previous,
    required this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  factory Game.fromJson(Map<String, dynamic>? json) {
    List<dynamic>? results = json?['results'] as List<dynamic>?;
    return Game(
      count: json?['count'] as int?,
      results: (results != null) ? results.map((e) => Result.fromJson(e as Map<String, dynamic>?))
          .toList() : [],
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results, seoTitle, seoDescription, seoKeywords, seoH1, noindex, nofollow, description, filters , nofollowCollections];
}
