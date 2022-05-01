part of 'app_settings_bloc.dart';

class AppSettingsState extends Equatable {
  final AppSettings? settings;
  final LOADING_STATUS status;

  const AppSettingsState({this.settings, this.status = LOADING_STATUS.initial});

  @override
  List<Object?> get props => [settings, status];

  AppSettingsState copyWith({AppSettings? settings, LOADING_STATUS? status}) {
    return AppSettingsState(
        settings: settings ?? this.settings, status: status ?? this.status);
  }
}
