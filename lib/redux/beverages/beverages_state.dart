// import 'package:meta/meta.dart';

import 'package:meta/meta.dart';

import 'package:riimu_coffee/models/beverage.dart';

@immutable
class BeveragesState {
  final bool isError;
  final bool isLoading;
  final List<Beverage> beverages;

  const BeveragesState({
    required this.isError,
    required this.isLoading,
    required this.beverages,
  });

  factory BeveragesState.initial() => const BeveragesState(
        isLoading: false,
        isError: false,
        beverages: [],
      );

  BeveragesState copyWith({
    required bool isError,
    required bool isLoading,
    required List<Beverage>? beverages,
  }) {
    return BeveragesState(
      isError: isError,
      isLoading: isLoading,
      beverages: beverages ??
          this.beverages, // Use null-aware operator to handle null case
    );
  }
}
