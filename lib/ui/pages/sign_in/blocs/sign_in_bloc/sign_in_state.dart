part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool isAuthenticated;

  const SignInState({this.isAuthenticated = false});

  @override
  List<Object?> get props => [isAuthenticated];

  SignInState copyWith({required bool authStatus}) {
    return SignInState(
      isAuthenticated: authStatus,
    );
  }
}
