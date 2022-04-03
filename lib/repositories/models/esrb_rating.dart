import 'package:equatable/equatable.dart';

class EsrbRating extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  @override
  List<Object?> get props => [id, name, slug];
}