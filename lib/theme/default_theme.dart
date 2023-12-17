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

// class DarkTheme {
//   final ColorScheme _colorScheme = ColorScheme.fromSeed(
//     background: const Color.fromARGB(255, 52, 48, 49),
//     seedColor: const Color.fromARGB(255, 240, 53, 85),
//     secondary: const Color.fromARGB(255, 0, 64, 12),
//     onPrimary: const Color.fromARGB(255, 95, 12, 26),
//     onSecondary: const Color.fromARGB(255, 45, 87, 53),
//     onBackground: const Color.fromARGB(255, 68, 35, 41),
//   );

//   get colorScheme => _colorScheme;
// }

// class CustomDarkTheme {
//   static final ThemeData darkTheme = ThemeData.dark().copyWith(
//     // Define your custom color scheme
//     colorScheme: ColorScheme.dark(
//       background: const Color.fromARGB(255, 52, 48, 49),
//       // seedColor: const Color.fromARGB(255, 240, 53, 85),
//       secondary: const Color.fromARGB(255, 0, 64, 12),
//       onPrimary: const Color.fromARGB(255, 95, 12, 26),
//       onSecondary: const Color.fromARGB(255, 45, 87, 53),
//       onBackground: const Color.fromARGB(255, 68, 35, 41),
//     ),
//   );
// }
