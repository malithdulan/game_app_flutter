import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/repositories/auth_repository.dart';

import '../../../../../helper/app_data.dart';
import '../../../../../helper/error.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final AuthRepository repository;
  SignOutBloc({required this.repository}) : super(const SignOutState()) {
    on<UserSignOut>(_mapUserSignOutToState);
  }

  void _mapUserSignOutToState(
      UserSignOut event, Emitter<SignOutState> emit) async {
    emit(state.copyWith(status: LOADING_STATUS.loading));
    try {
      bool value = await repository.signOutAccount();
      if (value) {
        //remove all the user data from the device
        repository.removeUserInfo();
      }
      AppData.shared.setUserStatus(value); //change app data status of user auth
      emit(state.copyWith(isSignedOut: value, status: LOADING_STATUS.success));
    } on NoInternetException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: LOADING_STATUS.error, errorMessage: e.error));
    }
  }
}
