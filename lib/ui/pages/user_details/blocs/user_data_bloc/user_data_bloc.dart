import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/repositories/settings_repository.dart';

import '../../../../../repositories/models/settings_models/user_data.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final SettingsRepository repository;
  UserDataBloc({required this.repository}) : super(const UserDataState()) {
    on<GetUserData>(_mapGetUserDataEventToState);
  }

  void _mapGetUserDataEventToState(
      GetUserData event, Emitter<UserDataState> emit) async {
    try {
      UserData data = await repository.getUserDatFromStorage();
      emit(state.copyWith(data: data, status: LOADING_STATUS.success));
    } catch (error) {
      emit(state.copyWith(status: LOADING_STATUS.error));
    }
  }
}
