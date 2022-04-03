import 'package:equatable/equatable.dart';

import 'dart:io';

import 'package:game_app/repositories/models/requirements.dart';

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

  @override
  List<Object?> get props => [platform, releasedAt, requirementsEn, requirementsRu];
}