part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailSignUp extends SignUpEvent {
  final SignUpUser? user;
  EmailSignUp({required this.user});
  @override
  List<Object?> get props => [user];
}