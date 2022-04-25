import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/repositories/models/auth_models/google_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_in_user.dart';

import '../../../../../helper/enums.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository repository;
  SignInBloc({required this.repository}) : super(const SignInState()) {
    on<GoogleSignIn>(_mapGoogleSignInEventToState);
    on<FacebookSignIn>(_mapFacebookSignInEventToState);
    on<EmailSignIn>(_mapEmailSignInEventToState);
  }

  void _mapGoogleSignInEventToState(
      GoogleSignIn event, Emitter<SignInState> emit) async {
    GoogleUser user = await repository.googleAuthentication();
    print(user.googleSignInAuthentication?.accessToken);

    emit(state.copyWith(state: AUTH_STATE.valid));
  }

  void _mapFacebookSignInEventToState(
      FacebookSignIn event, Emitter<SignInState> emit) async {
    String user = await repository.facebookAuthentication();
    print(user);
    emit(state.copyWith(state: AUTH_STATE.valid));
  }

  void _mapEmailSignInEventToState(
      EmailSignIn event, Emitter<SignInState> emit) async {
    int statusCode = await repository.signAccount(event.user);
    if (statusCode == 200) {
      //user authenticated
      emit(state.copyWith(state: AUTH_STATE.valid));
    } else {
      //status code 422, credentials wrong
      emit(state.copyWith(state: AUTH_STATE.inValid));
    }
  }
}
