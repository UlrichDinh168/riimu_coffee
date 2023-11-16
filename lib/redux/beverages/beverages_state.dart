// import 'package:meta/meta.dart';

import 'package:meta/meta.dart';

import 'package:riimu_coffee/models/beverage.dart';

@immutable
class BeveragesState {
  final bool? isError;
  final bool? isLoading;
  final List<Beverage>? beverages;

  const BeveragesState({
    this.isError = false,
    this.isLoading = false,
    this.beverages = const [],
  });

  factory BeveragesState.initial() => const BeveragesState(
        isLoading: false,
        isError: false,
        beverages: [],
      );

  BeveragesState copyWith({
    bool? isError,
    bool? isLoading,
    List<Beverage>? beverages,
  }) {
    return BeveragesState(
      isError: isError,
      isLoading: isLoading,
      beverages: beverages ??
          this.beverages, // Use null-aware operator to handle null case
    );
  }
}
