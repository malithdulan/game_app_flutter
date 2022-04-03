import 'package:equatable/equatable.dart';
import 'package:game_app/repositories/models/requirements.dart';
import 'package:game_app/repositories/models/platform.dart';

class PlatformElement extends Equatable {
  final Platform? platform;
  final DateTime? releasedAt;
  final Requirements? requirementsEn;
  final Requirements? requirementsRu;

  const PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory PlatformElement.fromJson(Map<String, dynamic>? json) {
    return PlatformElement(
      platform: Platform.fromJson(json?['platform'] as Map<String, dynamic>?),
      releasedAt: DateTime.tryParse((json?['released_at'] as String?) ?? ""),
      requirementsEn: Requirements.fromJson(
          json?['requirements_en'] as Map<String, dynamic>?),
      requirementsRu: Requirements.fromJson(
          json?['requirements_ru'] as Map<String, dynamic>?),
    );
  }

  @override
  List<Object?> get props => [platform, releasedAt, requirementsEn, requirementsRu];
}