import 'package:equatable/equatable.dart';

class ShortScreenshot extends Equatable {
  final int? id;
  final String? image;

  const ShortScreenshot({
    this.id,
    this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic>? json) {
    return ShortScreenshot(
      id: json?['id'] as int?,
      image: json?['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, image];
}