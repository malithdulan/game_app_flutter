part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final AUTH_STATE authState;
  final String? errorMessage;

  const SignUpState({this.authState = AUTH_STATE.initial, this.errorMessage});

  @override
  List<Object?> get props => [authState];

  SignUpState copyWith({required AUTH_STATE state, String? errorMessage}) {
    return SignUpState(
        authState: state, errorMessage: errorMessage ?? this.errorMessage);
  }
}
