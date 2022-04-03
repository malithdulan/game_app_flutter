part of 'games_bloc.dart';

class GamesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGames extends GamesEvent {
  final int pageNo;
  final bool isPaginating;

  GetGames({required this.pageNo, this.isPaginating = false});

  @override
  List<Object?> get props => [pageNo, isPaginating];
}
