part of 'game_details_back_button_bloc.dart';

class GameDetailsBackButtonState extends Equatable {
  final bool isColorChanged;
  const GameDetailsBackButtonState({this.isColorChanged = false});

  @override
  List<Object?> get props => [isColorChanged];

  GameDetailsBackButtonState copyWith({required bool? isColorChanged}) {
    return GameDetailsBackButtonState(
      isColorChanged: isColorChanged ?? this.isColorChanged,
    );
  }
}