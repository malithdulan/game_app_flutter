part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final bool value;
  ChangeTheme({required this.value});

  @override
  List<Object?> get props => [value];
}
