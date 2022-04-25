import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_app/repositories/auth_repository.dart';

import '../../../../helper/constants.dart';
import '../../../../helper/enums.dart';
import '../../../../helper/error.dart';
import '../../../../repositories/models/auth_models/sign_up_user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository repository;
  SignUpBloc({required this.repository}) : super(const SignUpState()) {
    on<EmailSignUp>(_mapEmailSignUpEventToState);
  }

  void _mapEmailSignUpEventToState(
      EmailSignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
        state: AUTH_STATE.loading)); //registration is in progress
    try {
      int statusCode = await repository.signUpAccount(event.user);
      if (statusCode == StatusCodes.statusCodeCreated) {
        //user created successfully
        emit(state.copyWith(state: AUTH_STATE.valid));
      } else if (statusCode == StatusCodes.statusCodeUnProcessableEntity) {
        //status code 422, user already registered
        emit(state.copyWith(
            state: AUTH_STATE.inValid, errorMessage: Constants.userExists));
      }
    } on NoInternetException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    } on NetworkException catch (e) {
      emit(state.copyWith(state: AUTH_STATE.inValid, errorMessage: e.error));
    }
  }
}
