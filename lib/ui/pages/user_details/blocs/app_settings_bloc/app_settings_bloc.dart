import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/repositories/models/settings_models/app_settings.dart';
import 'package:game_app/repositories/settings_repository.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final SettingsRepository repository;
  AppSettingsBloc({required this.repository})
      : super(const AppSettingsState()) {
    on<GetSettings>(_mapGetSettingsEventToState);
  }

  void _mapGetSettingsEventToState(
      GetSettings event, Emitter<AppSettingsState> emit) async {
    try {
      AppSettings data = await repository.getSettings();
      emit(state.copyWith(settings: data, status: LOADING_STATUS.success));
    } catch (error) {
      emit(state.copyWith(status: LOADING_STATUS.error));
    }
  }
}
