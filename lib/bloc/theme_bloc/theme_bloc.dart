import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetStorage _storage = GetStorage();
  final String _themeKey = 'selectedTheme';

  ThemeBloc() : super(ThemeInitial()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<UpdateThemeEvent>(_onUpdateTheme);
  }

  void _onLoadTheme(LoadThemeEvent event, Emitter<ThemeState> emit) {
    final int? storedColor = _storage.read(_themeKey);
    final color = storedColor != null ? Color(storedColor) : Colors.blue;
    emit(ThemeLoaded(color));
  }

  void _onUpdateTheme(UpdateThemeEvent event, Emitter<ThemeState> emit) {
    _storage.write(_themeKey, event.newColor.value);
    emit(ThemeLoaded(event.newColor));
  }
}
