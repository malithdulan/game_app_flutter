import 'package:equatable/equatable.dart';

import 'genre.dart';

class Store extends Equatable {
  final int? id;
  final Genre? store;

  const Store({
    this.id,
    this.store,
  });

  @override
  List<Object?> get props => [id, store];
}