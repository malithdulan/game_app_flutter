import 'package:equatable/equatable.dart';

class Requirements extends  Equatable{
  final String? minimum;
  final String? recommended;

  const Requirements({
    this.minimum,
    this.recommended,
  });

  @override
  List<Object?> get props => [minimum, recommended];
}