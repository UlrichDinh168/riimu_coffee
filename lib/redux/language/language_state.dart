import 'package:flutter/material.dart';

@immutable
class LanguageState {
  final String languageCode;

  const LanguageState({required this.languageCode});

  factory LanguageState.initial() => const LanguageState(languageCode: 'en_US');
}
