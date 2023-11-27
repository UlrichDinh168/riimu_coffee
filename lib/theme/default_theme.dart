import 'package:flutter/material.dart';

class DefaultTheme {
  final ColorScheme _colorScheme = ColorScheme.fromSeed(
    background: const Color.fromARGB(255, 253, 233, 236),
    seedColor: const Color.fromARGB(255, 240, 53, 85),
    secondary: const Color.fromARGB(255, 0, 64, 12),
    onPrimary: const Color.fromARGB(255, 95, 12, 26),
    onSecondary: const Color.fromARGB(255, 0, 64, 12),
    onBackground: const Color.fromARGB(255, 250, 188, 198),
  );

  get colorScheme => _colorScheme;
}
