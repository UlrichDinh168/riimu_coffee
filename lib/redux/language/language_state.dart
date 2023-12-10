import 'package:flutter/material.dart';

@immutable
class LanguageState {
  final String languageCode;

  const LanguageState({required this.languageCode});

  factory LanguageState.initial() => const LanguageState(languageCode: 'en');

  LanguageState copyWith({String? languageCode}) {
    return LanguageState(
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  String toString() {
    return 'LanguageState(languageCode: $languageCode)';
  }
}
