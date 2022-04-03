import 'package:equatable/equatable.dart';

class AddedByStatus extends Equatable {
  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toplay;
  final int? dropped;
  final int? playing;

  const AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  @override
  List<Object?> get props => [yet, owned, beaten, toplay, dropped, playing];
}