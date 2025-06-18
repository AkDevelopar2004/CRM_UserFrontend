part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class ThemeLoaded extends ThemeState {
  final Color selectedColor;

  const ThemeLoaded(this.selectedColor);

  @override
  List<Object> get props => [selectedColor];
}
