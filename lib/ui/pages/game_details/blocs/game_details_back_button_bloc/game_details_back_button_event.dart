part of 'game_details_back_button_bloc.dart';

class GameDetailsBackButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeBackButtonColor extends GameDetailsBackButtonEvent {
  final bool isColorChanged;
  ChangeBackButtonColor({this.isColorChanged = false});

  @override
  List<Object?> get props => [isColorChanged];
}