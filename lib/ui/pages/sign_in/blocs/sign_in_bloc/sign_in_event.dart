part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleSignIn extends SignInEvent {}

class FacebookSignIn extends SignInEvent {}

class EmailSignIn extends SignInEvent {
  @override
  List<Object?> get props => [];
}
