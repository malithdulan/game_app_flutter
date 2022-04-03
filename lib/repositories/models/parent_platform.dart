import 'package:equatable/equatable.dart';
import 'esrb_rating.dart';

class ParentPlatform extends Equatable {
  final EsrbRating? platform;
  const ParentPlatform({
    this.platform,
  });

  @override
  List<Object?> get props => [platform];
}