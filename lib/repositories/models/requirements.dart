import 'package:equatable/equatable.dart';

class Requirements extends  Equatable{
  final String? minimum;
  final String? recommended;

  const Requirements({
    this.minimum,
    this.recommended,
  });

  factory Requirements.fromJson(Map<String, dynamic>? json) {
    return Requirements(
      minimum: json?['minimum'] as String?,
      recommended: json?['recommended'] as String?
    );
  }

  @override
  List<Object?> get props => [minimum, recommended];
}