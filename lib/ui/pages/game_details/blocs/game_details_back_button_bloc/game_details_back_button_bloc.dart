import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_details_back_button_event.dart';
part 'game_details_back_button_state.dart';

class GameDetailsBackButtonBloc extends Bloc<GameDetailsBackButtonEvent, GameDetailsBackButtonState> {

  GameDetailsBackButtonBloc() : super(const GameDetailsBackButtonState()) {
    on<ChangeBackButtonColor>(_mapChangeBackButtonColorEventToState);
  }

  void _mapChangeBackButtonColorEventToState(ChangeBackButtonColor event, Emitter<GameDetailsBackButtonState> emit) {
    emit(state.copyWith(isColorChanged: event.isColorChanged));
  }
}

