part of 'games_bloc.dart';

class GamesState extends Equatable {
  final Game? data;
  final LOADING_STATUS status;
  final int? pageNo;
  final bool isPaginating;
  final String? errorMessage;

  const GamesState({
    this.status = LOADING_STATUS.initial,
    this.data,
    this.pageNo = 1,
    this.isPaginating = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, data, pageNo, isPaginating, errorMessage];

  GamesState copyWith({
    Game? data,
    LOADING_STATUS? status,
    int? pageNo,
    bool? isPaginating,
    String? errorMessage,
  }) {
    return GamesState(
      data: data ?? this.data,
      status: status ?? this.status,
      pageNo: pageNo ?? this.pageNo,
      isPaginating: isPaginating ?? this.isPaginating,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
