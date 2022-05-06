import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/repositories/models/auth_models/facebook_user.dart';
import 'package:game_app/repositories/models/auth_models/google_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_in_user.dart';

import '../../../../../helper/constants.dart';
import '../../../../../helper/enums.dart';
import '../../../../../helper/error.dart';

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
    emit(state.copyWith(
        state: AUTH_STATE.loading)); //authentication is in progress
    try {
      //google authentication
      GoogleUser user = await repository.googleAuthentication();
      if (user.googleSignInAuthentication?.accessToken != null) {
        //authenticate with back-end
        bool value = await repository.validateUser(user.googleSignInAccount?.email, user.googleSignInAccount?.id, ACCOUNT_TYPE.google);
        (value)
            ? emit(state.copyWith(state: AUTH_STATE.valid))
            : emit(state.copyWith(
                state: AUTH_STATE.inValid,
                errorMessage: Constants.somethingWrong));
      } else {
        emit(state.copyWith(
            state: AUTH_STATE.inValid, errorMessage: Constants.googleAuthFail));
      }
    } on NoInternetException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } on NetworkException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: Constants.somethingWrong));
    }
  }

  void _mapFacebookSignInEventToState(
      FacebookSignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        state: AUTH_STATE.loading)); //authentication is in progress
    try {
      //facebook authentication
      FacebookUser user = await repository.facebookAuthentication();
      if (user.loginResult?.status == LoginStatus.success && user.loginResult?.accessToken != null) {
        //authenticate with back-end
        bool value = await repository.validateUser(user.email, user.id, ACCOUNT_TYPE.facebook);
        (value)
            ? emit(state.copyWith(state: AUTH_STATE.valid))
            : emit(state.copyWith(
            state: AUTH_STATE.inValid,
            errorMessage: Constants.somethingWrong));
      } else {
        emit(state.copyWith(
            state: AUTH_STATE.inValid, errorMessage: Constants.facebookAuthFail));
      }
    } on NoInternetException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } on NetworkException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: Constants.somethingWrong));
    }
  }

  void _mapEmailSignInEventToState(
      EmailSignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        state: AUTH_STATE.loading)); //authentication is in progress
    try {
      int statusCode = await repository.signInAccount(event.user);
      if (statusCode == StatusCodes.statusCodeRequestSuccess) {
        //user authenticated
        emit(state.copyWith(state: AUTH_STATE.valid));
      } else if (statusCode == StatusCodes.statusCodeUnProcessableEntity) {
        //status code 422, credentials wrong
        emit(state.copyWith(
            state: AUTH_STATE.inValid,
            errorMessage: Constants.wrongCredentials));
      }
    } on NoInternetException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } on NetworkException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: Constants.somethingWrong));
    }
  }
}
