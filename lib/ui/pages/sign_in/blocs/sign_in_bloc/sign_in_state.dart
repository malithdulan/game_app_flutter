part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final AUTH_STATE authState;
  final String? errorMessage;

  const SignInState({this.authState = AUTH_STATE.initial, this.errorMessage});

  @override
  List<Object?> get props => [authState];

  SignInState copyWith({required AUTH_STATE state, String? errorMessage}) {
    return SignInState(
        authState: state, errorMessage: errorMessage ?? this.errorMessage);
  }
}
