part of 'sign_out_bloc.dart';

class SignOutState extends Equatable {
  final bool isSignedOut;
  final LOADING_STATUS status;
  final String? errorMessage;

  const SignOutState(
      {this.isSignedOut = false,
      this.status = LOADING_STATUS.initial,
      this.errorMessage});

  @override
  List<Object?> get props => [isSignedOut, status, errorMessage];

  SignOutState copyWith(
      {bool? isSignedOut, LOADING_STATUS? status, String? errorMessage}) {
    return SignOutState(
      isSignedOut: isSignedOut ?? this.isSignedOut,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
