import 'package:flutter/material.dart';

@immutable
class ThemeState {
  final String themeMode;

  const ThemeState({required this.themeMode});

  factory ThemeState.initial() => const ThemeState(themeMode: 'null');

  ThemeState copyWith({String? themeMode}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  String toString() {
    return 'ThemeState(themeMode: $themeMode)';
  }
}
