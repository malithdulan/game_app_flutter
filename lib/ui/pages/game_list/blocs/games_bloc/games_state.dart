part of 'games_bloc.dart';

class GamesState extends Equatable {
  final Game? data;
  final LOADING_STATUS status;
  final int? pageNo;
  final bool isPaginating;

  const GamesState({this.status = LOADING_STATUS.initial, this.data, this.pageNo = 1, this.isPaginating = false});

  @override
  List<Object?> get props => [status, data, pageNo, isPaginating];

  GamesState copyWith({Game? data, LOADING_STATUS? status, int? pageNo, bool? isPaginating}) {
    return GamesState(
      data: data ?? this.data,
      status: status ?? this.status,
      pageNo: pageNo ?? this.pageNo,
      isPaginating: isPaginating ?? this.isPaginating,
    );
  }
}