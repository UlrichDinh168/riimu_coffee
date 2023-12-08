import 'package:meta/meta.dart';

import 'package:riimu_coffee/models/beverage.dart';

@immutable
class BeveragesState {
  final bool isError;
  final bool isLoading;
  final List<Beverage> beverages;
  final int pageNumber;
  final bool end;
  final List<String> selectedBeveragesTitles;

  const BeveragesState({
    required this.isError,
    required this.isLoading,
    required this.beverages,
    required this.pageNumber,
    required this.end,
    required this.selectedBeveragesTitles,
  });

  factory BeveragesState.initial(
      {bool isError = false, bool isLoading = false}) {
    return const BeveragesState(
        isLoading: false,
        isError: false,
        pageNumber: 0,
        end: false,
        beverages: [],
        selectedBeveragesTitles: []);
  }

  List<String> get availableTitles {
    return beverages.map((beverage) => beverage.title).toSet().toList();
  }

  BeveragesState copyWith(
      {bool? isError,
      bool? isLoading,
      int? pageNumber,
      bool? end,
      List<Beverage>? beverages,
      List<String>? selectedBeveragesTitles}) {
    return BeveragesState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      pageNumber: pageNumber ?? this.pageNumber,
      end: end ?? this.end,
      beverages: beverages ?? this.beverages,
      selectedBeveragesTitles:
          selectedBeveragesTitles ?? this.selectedBeveragesTitles,
    );
  }

  @override
  String toString() {
    return 'BeveragesState{isError: $isError, isLoading: $isLoading, beverages: $beverages}';
  }
}
