import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          const ThemeState(
            themeMode: ThemeMode.system,
          ),
        ) {
    on<ChangeTheme>(_mapChangeThemeEventToState);
  }

  void _mapChangeThemeEventToState(
      ChangeTheme event, Emitter<ThemeState> emit) {
    emit(
      ThemeState(themeMode: event.value ? ThemeMode.dark : ThemeMode.light),
    );
  }
}
