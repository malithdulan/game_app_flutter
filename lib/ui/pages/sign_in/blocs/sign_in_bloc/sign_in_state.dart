part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final AUTH_STATE authState;

  const SignInState({this.authState = AUTH_STATE.initial});

  @override
  List<Object?> get props => [AUTH_STATE];

  SignInState copyWith({required AUTH_STATE state}) {
    return SignInState(
      authState: state,
    );
  }
}
