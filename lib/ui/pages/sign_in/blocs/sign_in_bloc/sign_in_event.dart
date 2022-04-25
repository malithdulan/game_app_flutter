part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleSignIn extends SignInEvent {}

class FacebookSignIn extends SignInEvent {}

class EmailSignIn extends SignInEvent {
  final SignInUser? user;
  EmailSignIn({required this.user});
  @override
  List<Object?> get props => [user];
}
